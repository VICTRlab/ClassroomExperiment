Shader "Custom/SSVideoShader" {
	Properties{
		//_Tint("Tint Color", Color) = (.5, .5, .5, .5)
		_BGRemoval("Background removal (w=tol)", Color) = (.5, .5, .5, 0.0)
		//[Gamma] _Exposure("Exposure", Range(0, 8)) = 1.0
		[NoScaleOffset] _Tex("VideoTexture", 2D) = "grey" {}
	}

		SubShader{
		Tags{ "Queue" = "Transparent" "RenderType" = "Transparent" "PreviewType" = "Skybox"  }
		Cull Off

		Blend SrcAlpha OneMinusSrcAlpha

		Pass{

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma target 2.0

#include "UnityCG.cginc"
	//half4 _Tint;
	float4 _BGRemoval;
	//half _Exposure;
	sampler2D _Tex;
	float4 _Tex_TexelSize;
	half4 _Tex_HDR;

	struct appdata_t {
		float4 vertex : POSITION;
		float2 texcoord : TEXCOORD0;
		UNITY_VERTEX_INPUT_INSTANCE_ID
	};

	struct v2f {
		float4 vertex : SV_POSITION;
		float2 texcoord : TEXCOORD0;
		UNITY_VERTEX_OUTPUT_STEREO
	};

	v2f vert(appdata_t v)
	{
		v2f o;
		UNITY_SETUP_INSTANCE_ID(v);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		o.vertex = UnityObjectToClipPos(v.vertex);

		// If this is the left eye, we want the texture coords of the vertex to go from (0, 0), to (0.5, 1)
		if (unity_StereoEyeIndex == 0)
		{
			o.texcoord = float2(v.texcoord.x * 0.5, v.texcoord.y);
		}
		// If it's right eye, then we want (0.5, 0) to (1, 1)
		else
		{
			o.texcoord = float2(v.texcoord.x * 0.5 + 0.5, v.texcoord.y);
		}
		return o;
	}

	fixed4 frag(v2f i) : SV_Target
	{
		//return fixed4(1, 1, 1, 1);
		float2 tc = i.texcoord;// ToRadialCoords(i.texcoord);
		
		//if (tc.x > i.image180ScaleAndCutoff[1])
			//return half4(0,0,0,1);
		//tc.x = fmod(tc.x*i.image180ScaleAndCutoff[0], 1);
		//tc = (tc + i.layout3DScaleAndOffset.xy) * i.layout3DScaleAndOffset.zw;

		half4 tex = tex2D(_Tex, tc);
		half3 c = DecodeHDR(tex, _Tex_HDR);
		//c = c * _Tint.rgb * unity_ColorSpaceDouble.rgb;

		float alpha = 1.0;

		float diff= length((c - _BGRemoval.rgb));
		if (diff < _BGRemoval.w)
		{
			alpha = 0;
		}

		//c *= _Exposure;
		//c = half3(1, 1, 1);
		return half4(c, alpha);
	}
	
	ENDCG
	}
}


//CustomEditor "SSVideoShaderGUI"
Fallback Off

}