Shader "Custom/StandardVideo" {
	Properties{
		[NoScaleOffset] _Tex("VideoTexture", 2D) = "grey" {}
	}

		SubShader{
		Tags{ "Queue" = "Geometry" "RenderType" = "Opaque"}
		Cull Off

		Pass{

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma target 2.0

#include "UnityCG.cginc"
	half4 _Tint;
	half _Exposure;
	sampler2D _Tex;
	float4 _Tex_TexelSize;
	half4 _Tex_HDR;

	struct appdata_t {
		float4 vertex : POSITION;
		float2 texcoord : TEXCOORD0;
	};

	struct v2f {
		float4 vertex : SV_POSITION;
		float2 texcoord : TEXCOORD0;
	};

	v2f vert(appdata_t v)
	{
		v2f o;
		o.vertex = UnityObjectToClipPos(v.vertex);
		o.texcoord = v.texcoord;
		return o;
	}

	fixed4 frag(v2f i) : SV_Target
	{
		float2 tc = i.texcoord;// ToRadialCoords(i.texcoord);

		half4 tex = tex2D(_Tex, tc);
		half3 c = DecodeHDR(tex, _Tex_HDR);
		//c = c * _Tint.rgb * unity_ColorSpaceDouble.rgb;
		
		//c *= _Exposure;
		//c = half3(1, 1, 1);
		return half4(c, 1);
	}
	
	ENDCG
	}
}

Fallback Off

}