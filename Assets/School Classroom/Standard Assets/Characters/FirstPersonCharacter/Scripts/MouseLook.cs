using System;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

namespace UnityStandardAssets.Characters.FirstPerson
{
    [Serializable]
    public class MouseLook
    {
        public bool enabled = true;
        public float XSensitivity = 2f;
        public float YSensitivity = 2f;
        public bool clampVerticalRotation = false;
        public float MinimumX = -90F;
        public float MaximumX = 90F;
        public bool smooth;
        public float smoothTime = 5f;
        public float lookSpeed = 4f;
        public bool lockCursor = true;
        public Vector3 lookThresholds = new Vector3(5.0f, 10.0f, 180.0f);


        private Quaternion m_CharacterTargetRot;
        private Quaternion m_CameraTargetRot;
        private bool m_cursorIsLocked = true;

        public void Init(Transform character, Transform camera)
        {
            m_CharacterTargetRot = character.localRotation;
            m_CameraTargetRot = camera.localRotation;
        }

        public void VRRotation(Transform character, Transform head, Transform camera)
        {
            var charRot = character.rotation;
            var charAngles = charRot.eulerAngles;
            charAngles.x = 0.0f;
            charAngles.z = 0.0f;
            var charQ = Quaternion.Euler(charAngles);

            var camRot = camera.rotation;
            var camAngles = camRot.eulerAngles;
            camAngles.x = 0.0f;
            camAngles.z = 0.0f;
            var camQ = Quaternion.Euler(camAngles);

            var yDiff = Quaternion.Angle(charQ, camQ);

            // Apply y rotation to player
            if (yDiff > lookThresholds.y)
            {
                //character.rotation = Quaternion.RotateTowards(charQ, camQ, lookSpeed * Time.deltaTime);
                var dy = Mathf.Clamp((yDiff - lookThresholds.y) / lookThresholds.y, 0.0f, 1.0f);
                character.rotation = Quaternion.Slerp(charQ, camQ, lookSpeed * Time.deltaTime * dy);
            }

            // v1
            //float qa = Quaternion.Angle(character.rotation, camera.rotation);

            //if (qa > lookThresholds.x)
            //{
            //    if (smooth)
            //    {
            //        character.rotation = Quaternion.Slerp(character.rotation, camera.rotation,
            //            smoothTime * Time.deltaTime);
            //    }
            //    else
            //    {
            //        character.rotation = camera.rotation;
            //    }
            //}

            //camAngles = camRot.eulerAngles;
            //camAngles.x = Mathf.Clamp(camAngles.x, -90.0f, 90.0f);
            //// X rotation can be applied to head transform
            //if (Mathf.Abs(qe.x) > lookThresholds.x)
            //{

            //}

            UpdateCursorLock();
        }

        public void LookRotation(Transform character, Transform head, Transform camera)
        {
            float yRot = CrossPlatformInputManager.GetAxis("Mouse X") * XSensitivity;
            float xRot = CrossPlatformInputManager.GetAxis("Mouse Y") * YSensitivity;

            //m_CharacterTargetRot *= Quaternion.Euler (-xRot, yRot, 0f);
            //m_CameraTargetRot *= Quaternion.Euler (-xRot, 0f, 0f);

            //if(clampVerticalRotation)
            //    m_CameraTargetRot = ClampRotationAroundXAxis (m_CameraTargetRot);


            var nextCharacterRot = character.rotation * Quaternion.Euler(0.0f, yRot * lookSpeed * Time.deltaTime, 0.0f);
            var nextHeadRot = head.localRotation * Quaternion.Euler(-xRot * lookSpeed * Time.deltaTime, 0.0f, 0.0f);

            if (smooth)
            {
                character.rotation = Quaternion.Slerp(character.rotation, nextCharacterRot, smoothTime * Time.deltaTime);
                //head.rotation = Quaternion.Slerp(head.rotation, nextHeadRot, smoothTime * Time.deltaTime);
                //character.localRotation = Quaternion.Slerp (character.localRotation, m_CharacterTargetRot,
                //    smoothTime * Time.deltaTime);
                //camera.localRotation = Quaternion.Slerp (camera.localRotation, m_CameraTargetRot,
                //    smoothTime * Time.deltaTime);
            }
            else
            {
                character.rotation = nextCharacterRot;
                head.localRotation = nextHeadRot;

                //character.localRotation = m_CharacterTargetRot;
                //camera.localRotation = m_CameraTargetRot;
            }

            

            UpdateCursorLock();
        }

        public void SetCursorLock(bool value)
        {
            lockCursor = value;
            if(!lockCursor)
            {//we force unlock the cursor if the user disable the cursor locking helper
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
            }
        }

        public void UpdateCursorLock()
        {
            //if the user set "lockCursor" we check & properly lock the cursos
            if (lockCursor)
                InternalLockUpdate();
        }

        private void InternalLockUpdate()
        {
            if(Input.GetKeyUp(KeyCode.Escape))
            {
                m_cursorIsLocked = false;
            }
            else if(Input.GetMouseButtonUp(0))
            {
                m_cursorIsLocked = true;
            }

            if (m_cursorIsLocked)
            {
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
            }
            else if (!m_cursorIsLocked)
            {
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
            }
        }

        Quaternion ClampRotationAroundXAxis(Quaternion q)
        {
            q.x /= q.w;
            q.y /= q.w;
            q.z /= q.w;
            q.w = 1.0f;

            float angleX = 2.0f * Mathf.Rad2Deg * Mathf.Atan (q.x);

            angleX = Mathf.Clamp (angleX, MinimumX, MaximumX);

            q.x = Mathf.Tan (0.5f * Mathf.Deg2Rad * angleX);

            return q;
        }

    }
}
