// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:True,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-7420-OUT,spec-1438-OUT,gloss-5566-OUT,normal-852-OUT,alpha-2751-OUT;n:type:ShaderForge.SFN_Multiply,id:7420,x:32360,y:32224,varname:node_7420,prsc:2|A-6476-OUT,B-4474-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9486,x:31765,y:30798,varname:node_9486,prsc:2,sctp:2;n:type:ShaderForge.SFN_Tex2d,id:6144,x:31259,y:32081,ptovrint:False,ptlb:_Diffuse map,ptin:__Diffusemap,varname:_ReflectionTex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-533-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7533,x:32082,y:30965,ptovrint:False,ptlb:ReflectionTex,ptin:_ReflectionTex,varname:node_7533,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-9486-UVOUT;n:type:ShaderForge.SFN_Blend,id:6476,x:33138,y:31820,varname:node_6476,prsc:2,blmd:6,clmp:True|SRC-21-OUT,DST-7548-OUT;n:type:ShaderForge.SFN_Tex2d,id:7734,x:31115,y:31444,ptovrint:False,ptlb:_Reflection mask,ptin:__Reflectionmask,varname:node_7734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:87db03816c0e6754fbb7bf08d7782cf4,ntxv:0,isnm:False|UVIN-533-UVOUT;n:type:ShaderForge.SFN_Vector3,id:258,x:31558,y:31492,varname:node_258,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Lerp,id:5129,x:31836,y:31598,varname:node_5129,prsc:2|A-258-OUT,B-9216-OUT,T-4598-OUT;n:type:ShaderForge.SFN_Slider,id:4598,x:31505,y:31905,ptovrint:False,ptlb:Mask Spread,ptin:_MaskSpread,varname:node_4598,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:4;n:type:ShaderForge.SFN_RemapRange,id:9211,x:31330,y:31628,varname:node_9211,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-7734-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:9216,x:31622,y:31647,ptovrint:False,ptlb:Invert Reflection Mask,ptin:_InvertReflectionMask,varname:node_9216,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7734-RGB,B-9211-OUT;n:type:ShaderForge.SFN_TexCoord,id:533,x:30772,y:31806,varname:node_533,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:4065,x:32496,y:34538,ptovrint:False,ptlb:_Transparency,ptin:__Transparency,varname:node_3421,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:2751,x:32766,y:34256,varname:node_2751,prsc:2|A-975-OUT,B-9357-OUT,T-4065-OUT;n:type:ShaderForge.SFN_Vector1,id:975,x:32523,y:34170,varname:node_975,prsc:2,v1:1;n:type:ShaderForge.SFN_Cubemap,id:3105,x:29140,y:32390,ptovrint:False,ptlb:_Cube map ,ptin:__Cubemap,varname:node_3326,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:1|MIP-1880-OUT;n:type:ShaderForge.SFN_Fresnel,id:7200,x:29861,y:33005,varname:node_7200,prsc:2|EXP-9497-OUT;n:type:ShaderForge.SFN_Slider,id:3949,x:29332,y:33318,ptovrint:False,ptlb:Cube map Edges,ptin:_CubemapEdges,varname:node_9228,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Lerp,id:6423,x:29471,y:32604,varname:node_6423,prsc:2|A-9588-OUT,B-689-OUT,T-5239-OUT;n:type:ShaderForge.SFN_Multiply,id:8149,x:29719,y:32604,varname:node_8149,prsc:2|A-3105-RGB,B-6423-OUT;n:type:ShaderForge.SFN_Slider,id:5239,x:29088,y:32767,ptovrint:False,ptlb:Cube map Intensity,ptin:_CubemapIntensity,varname:_ReflectionGlow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Vector1,id:9588,x:29195,y:32562,varname:node_9588,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:689,x:29195,y:32632,varname:node_689,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:4520,x:31430,y:32782,varname:node_4520,prsc:2|A-8149-OUT,B-490-OUT;n:type:ShaderForge.SFN_Lerp,id:9497,x:29721,y:33146,varname:node_9497,prsc:2|A-6096-OUT,B-8356-OUT,T-3949-OUT;n:type:ShaderForge.SFN_Vector1,id:6096,x:29489,y:33014,varname:node_6096,prsc:2,v1:10;n:type:ShaderForge.SFN_Vector1,id:8356,x:29489,y:33118,varname:node_8356,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:5000,x:30024,y:33205,varname:node_5000,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1|IN-7200-OUT;n:type:ShaderForge.SFN_Multiply,id:490,x:30194,y:32952,varname:node_490,prsc:2|A-7200-OUT,B-7200-OUT,C-5000-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:1880,x:28957,y:32457,varname:node_1880,prsc:2,a:0,b:6|IN-5836-OUT;n:type:ShaderForge.SFN_Slider,id:5836,x:28573,y:32478,ptovrint:False,ptlb:Cube map Blur ,ptin:_CubemapBlur,varname:node_5181,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRange,id:9848,x:32244,y:34352,varname:node_9848,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-7734-R;n:type:ShaderForge.SFN_SwitchProperty,id:9357,x:32523,y:34267,ptovrint:False,ptlb:Invert Transparency Mask,ptin:_InvertTransparencyMask,varname:_InvertMask_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7734-R,B-9848-OUT;n:type:ShaderForge.SFN_Vector3,id:5789,x:31786,y:31354,varname:node_5789,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:7548,x:32092,y:31547,varname:node_7548,prsc:2|A-5789-OUT,B-5129-OUT,T-9696-OUT;n:type:ShaderForge.SFN_Slider,id:9696,x:31870,y:31886,ptovrint:False,ptlb:Mask Intensity,ptin:_MaskIntensity,varname:node_9696,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:5566,x:31217,y:34249,ptovrint:False,ptlb:Glossiness,ptin:_Glossiness,varname:node_9155,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Slider,id:3748,x:30887,y:34105,ptovrint:False,ptlb:Specular Intensity,ptin:_SpecularIntensity,varname:node_5639,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Vector3,id:6052,x:31102,y:34442,varname:node_6052,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Tex2d,id:4046,x:31102,y:34580,ptovrint:False,ptlb:_Normal Map,ptin:__NormalMap,varname:node_4173,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:852,x:31371,y:34572,varname:node_852,prsc:2|A-6052-OUT,B-4046-RGB,T-4164-OUT;n:type:ShaderForge.SFN_Slider,id:5941,x:30697,y:34954,ptovrint:False,ptlb:Normal Intensity,ptin:_NormalIntensity,varname:node_754,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Tex2d,id:4445,x:31094,y:33906,ptovrint:False,ptlb:_Specular Map,ptin:__SpecularMap,varname:node_9568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:503,x:31437,y:34039,varname:node_503,prsc:2|A-4445-RGB,B-6405-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:4164,x:31159,y:34874,varname:node_4164,prsc:2,a:0,b:2|IN-5941-OUT;n:type:ShaderForge.SFN_Multiply,id:1438,x:31766,y:33895,varname:node_1438,prsc:2|A-3532-OUT,B-503-OUT;n:type:ShaderForge.SFN_Power,id:3532,x:31601,y:33814,varname:node_3532,prsc:2|VAL-924-OUT,EXP-5761-OUT;n:type:ShaderForge.SFN_Exp,id:5761,x:31437,y:33814,varname:node_5761,prsc:2,et:0|IN-3153-OUT;n:type:ShaderForge.SFN_Vector1,id:924,x:31443,y:33732,varname:node_924,prsc:2,v1:3;n:type:ShaderForge.SFN_ConstantLerp,id:6405,x:31238,y:34072,varname:node_6405,prsc:2,a:0,b:2|IN-3748-OUT;n:type:ShaderForge.SFN_Vector1,id:3153,x:31269,y:33784,varname:node_3153,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:1352,x:31381,y:32425,ptovrint:False,ptlb:Diffuse to white (Mirror Brightness),ptin:_DiffusetowhiteMirrorBrightness,varname:node_9856,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:4153,x:31679,y:32206,varname:node_4153,prsc:2|A-6144-RGB,B-3389-OUT;n:type:ShaderForge.SFN_Lerp,id:4474,x:31981,y:32307,varname:node_4474,prsc:2|A-4153-OUT,B-3389-OUT,T-1352-OUT;n:type:ShaderForge.SFN_Vector3,id:3389,x:31460,y:32040,varname:node_3389,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_OneMinus,id:740,x:32378,y:31143,varname:node_740,prsc:2|IN-7533-A;n:type:ShaderForge.SFN_Blend,id:9891,x:32619,y:31255,varname:node_9891,prsc:2,blmd:1,clmp:True|SRC-740-OUT,DST-4520-OUT;n:type:ShaderForge.SFN_Multiply,id:21,x:33093,y:30894,varname:node_21,prsc:2|A-7533-RGB,B-8415-OUT,C-8020-RGB;n:type:ShaderForge.SFN_Add,id:8415,x:32821,y:31103,varname:node_8415,prsc:2|A-7533-A,B-9891-OUT;n:type:ShaderForge.SFN_Color,id:8020,x:32706,y:30704,ptovrint:False,ptlb:Color Tint,ptin:_ColorTint,varname:node_5257,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;proporder:8020-1352-7734-7533-9216-4598-9696-6144-4046-5941-4445-3748-5566-3105-5239-5836-3949-4065-9357;pass:END;sub:END;*/

Shader "Ciconia Studio/Effects/MirrorReflection/Deferred rendering/Diffuse Bump" {
    Properties {
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        _DiffusetowhiteMirrorBrightness ("Diffuse to white (Mirror Brightness)", Range(0, 1)) = 0
        __Reflectionmask ("_Reflection mask", 2D) = "white" {}
        [HideInInspector]_ReflectionTex ("ReflectionTex", 2D) = "bump" {}
        [MaterialToggle] _InvertReflectionMask ("Invert Reflection Mask", Float ) = 0
        _MaskSpread ("Mask Spread", Range(0, 4)) = 0
        _MaskIntensity ("Mask Intensity", Range(0, 1)) = 1
        __Diffusemap ("_Diffuse map", 2D) = "white" {}
        __NormalMap ("_Normal Map", 2D) = "bump" {}
        _NormalIntensity ("Normal Intensity", Range(0, 1)) = 0.5
        __SpecularMap ("_Specular Map", 2D) = "white" {}
        _SpecularIntensity ("Specular Intensity", Range(0, 1)) = 0.5
        _Glossiness ("Glossiness", Range(0, 1)) = 0.5
        __Cubemap ("_Cube map ", Cube) = "_Skybox" {}
        _CubemapIntensity ("Cube map Intensity", Range(0, 1)) = 0.3
        _CubemapBlur ("Cube map Blur ", Range(0, 1)) = 0
        _CubemapEdges ("Cube map Edges", Range(0, 1)) = 0.5
        __Transparency ("_Transparency", Range(0, 1)) = 0
        [MaterialToggle] _InvertTransparencyMask ("Invert Transparency Mask", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            #pragma glsl
            uniform sampler2D __Diffusemap; uniform float4 __Diffusemap_ST;
            uniform sampler2D _ReflectionTex; uniform float4 _ReflectionTex_ST;
            uniform sampler2D __Reflectionmask; uniform float4 __Reflectionmask_ST;
            uniform float _MaskSpread;
            uniform fixed _InvertReflectionMask;
            uniform float __Transparency;
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _CubemapBlur;
            uniform fixed _InvertTransparencyMask;
            uniform float _MaskIntensity;
            uniform float _Glossiness;
            uniform float _SpecularIntensity;
            uniform sampler2D __NormalMap; uniform float4 __NormalMap_ST;
            uniform float _NormalIntensity;
            uniform sampler2D __SpecularMap; uniform float4 __SpecularMap_ST;
            uniform float _DiffusetowhiteMirrorBrightness;
            uniform float4 _ColorTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
                UNITY_FOG_COORDS(8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 __NormalMap_var = UnpackNormal(tex2D(__NormalMap,TRANSFORM_TEX(i.uv0, __NormalMap)));
                float3 normalLocal = lerp(float3(0,0,1),__NormalMap_var.rgb,lerp(0,2,_NormalIntensity));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Glossiness;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 __SpecularMap_var = tex2D(__SpecularMap,TRANSFORM_TEX(i.uv0, __SpecularMap));
                float3 specularColor = (pow(3.0,exp(0.0))*(__SpecularMap_var.rgb*lerp(0,2,_SpecularIntensity)));
                float3 directSpecular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 indirectSpecular = (gi.indirect.specular)*specularColor;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(sceneUVs.rg, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float4 __Reflectionmask_var = tex2D(__Reflectionmask,TRANSFORM_TEX(i.uv0, __Reflectionmask));
                float4 __Diffusemap_var = tex2D(__Diffusemap,TRANSFORM_TEX(i.uv0, __Diffusemap));
                float3 node_3389 = float3(1,1,1);
                float3 diffuseColor = (saturate((1.0-(1.0-(_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_CubemapBlur))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb))*(1.0-lerp(float3(1,1,1),lerp(float3(0,0,0),lerp( __Reflectionmask_var.rgb, (__Reflectionmask_var.rgb*-1.0+1.0), _InvertReflectionMask ),_MaskSpread),_MaskIntensity))))*lerp((__Diffusemap_var.rgb*node_3389),node_3389,_DiffusetowhiteMirrorBrightness));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,lerp(1.0,lerp( __Reflectionmask_var.r, (__Reflectionmask_var.r*-1.0+1.0), _InvertTransparencyMask ),__Transparency));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            #pragma glsl
            uniform sampler2D __Diffusemap; uniform float4 __Diffusemap_ST;
            uniform sampler2D _ReflectionTex; uniform float4 _ReflectionTex_ST;
            uniform sampler2D __Reflectionmask; uniform float4 __Reflectionmask_ST;
            uniform float _MaskSpread;
            uniform fixed _InvertReflectionMask;
            uniform float __Transparency;
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _CubemapBlur;
            uniform fixed _InvertTransparencyMask;
            uniform float _MaskIntensity;
            uniform float _Glossiness;
            uniform float _SpecularIntensity;
            uniform sampler2D __NormalMap; uniform float4 __NormalMap_ST;
            uniform float _NormalIntensity;
            uniform sampler2D __SpecularMap; uniform float4 __SpecularMap_ST;
            uniform float _DiffusetowhiteMirrorBrightness;
            uniform float4 _ColorTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
                LIGHTING_COORDS(8,9)
                UNITY_FOG_COORDS(10)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 __NormalMap_var = UnpackNormal(tex2D(__NormalMap,TRANSFORM_TEX(i.uv0, __NormalMap)));
                float3 normalLocal = lerp(float3(0,0,1),__NormalMap_var.rgb,lerp(0,2,_NormalIntensity));
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Glossiness;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 __SpecularMap_var = tex2D(__SpecularMap,TRANSFORM_TEX(i.uv0, __SpecularMap));
                float3 specularColor = (pow(3.0,exp(0.0))*(__SpecularMap_var.rgb*lerp(0,2,_SpecularIntensity)));
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(sceneUVs.rg, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float4 __Reflectionmask_var = tex2D(__Reflectionmask,TRANSFORM_TEX(i.uv0, __Reflectionmask));
                float4 __Diffusemap_var = tex2D(__Diffusemap,TRANSFORM_TEX(i.uv0, __Diffusemap));
                float3 node_3389 = float3(1,1,1);
                float3 diffuseColor = (saturate((1.0-(1.0-(_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_CubemapBlur))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb))*(1.0-lerp(float3(1,1,1),lerp(float3(0,0,0),lerp( __Reflectionmask_var.rgb, (__Reflectionmask_var.rgb*-1.0+1.0), _InvertReflectionMask ),_MaskSpread),_MaskIntensity))))*lerp((__Diffusemap_var.rgb*node_3389),node_3389,_DiffusetowhiteMirrorBrightness));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * lerp(1.0,lerp( __Reflectionmask_var.r, (__Reflectionmask_var.r*-1.0+1.0), _InvertTransparencyMask ),__Transparency),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 ps3 
            #pragma target 3.0
            #pragma glsl
            uniform sampler2D __Diffusemap; uniform float4 __Diffusemap_ST;
            uniform sampler2D _ReflectionTex; uniform float4 _ReflectionTex_ST;
            uniform sampler2D __Reflectionmask; uniform float4 __Reflectionmask_ST;
            uniform float _MaskSpread;
            uniform fixed _InvertReflectionMask;
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _CubemapBlur;
            uniform float _MaskIntensity;
            uniform float _Glossiness;
            uniform float _SpecularIntensity;
            uniform sampler2D __SpecularMap; uniform float4 __SpecularMap_ST;
            uniform float _DiffusetowhiteMirrorBrightness;
            uniform float4 _ColorTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(sceneUVs.rg, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float4 __Reflectionmask_var = tex2D(__Reflectionmask,TRANSFORM_TEX(i.uv0, __Reflectionmask));
                float4 __Diffusemap_var = tex2D(__Diffusemap,TRANSFORM_TEX(i.uv0, __Diffusemap));
                float3 node_3389 = float3(1,1,1);
                float3 diffColor = (saturate((1.0-(1.0-(_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_CubemapBlur))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb))*(1.0-lerp(float3(1,1,1),lerp(float3(0,0,0),lerp( __Reflectionmask_var.rgb, (__Reflectionmask_var.rgb*-1.0+1.0), _InvertReflectionMask ),_MaskSpread),_MaskIntensity))))*lerp((__Diffusemap_var.rgb*node_3389),node_3389,_DiffusetowhiteMirrorBrightness));
                float4 __SpecularMap_var = tex2D(__SpecularMap,TRANSFORM_TEX(i.uv0, __SpecularMap));
                float3 specColor = (pow(3.0,exp(0.0))*(__SpecularMap_var.rgb*lerp(0,2,_SpecularIntensity)));
                float roughness = 1.0 - _Glossiness;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
