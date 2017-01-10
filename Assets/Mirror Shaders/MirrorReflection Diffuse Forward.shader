// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:True,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:2,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-7420-OUT,alpha-2751-OUT;n:type:ShaderForge.SFN_Multiply,id:7420,x:32595,y:32056,varname:node_7420,prsc:2|A-6476-OUT,B-1186-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9486,x:31422,y:30147,varname:node_9486,prsc:2,sctp:2;n:type:ShaderForge.SFN_Tex2d,id:6144,x:31349,y:32081,ptovrint:False,ptlb:_Diffuse map,ptin:__Diffusemap,varname:_ReflectionTex_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-533-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7533,x:31896,y:30333,ptovrint:False,ptlb:ReflectionTex,ptin:_ReflectionTex,varname:node_7533,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-2487-OUT;n:type:ShaderForge.SFN_Blend,id:6476,x:32232,y:31313,varname:node_6476,prsc:2,blmd:6,clmp:True|SRC-1318-OUT,DST-7548-OUT;n:type:ShaderForge.SFN_Tex2d,id:7734,x:30915,y:31251,ptovrint:False,ptlb:_Reflection mask,ptin:__Reflectionmask,varname:node_7734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:87db03816c0e6754fbb7bf08d7782cf4,ntxv:0,isnm:False|UVIN-533-UVOUT;n:type:ShaderForge.SFN_Vector3,id:258,x:31349,y:31171,varname:node_258,prsc:2,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Lerp,id:5129,x:31638,y:31391,varname:node_5129,prsc:2|A-258-OUT,B-9216-OUT,T-4598-OUT;n:type:ShaderForge.SFN_Slider,id:4598,x:31307,y:31698,ptovrint:False,ptlb:Mask Spread,ptin:_MaskSpread,varname:node_4598,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:4;n:type:ShaderForge.SFN_RemapRange,id:9211,x:31127,y:31445,varname:node_9211,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-7734-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:9216,x:31412,y:31371,ptovrint:False,ptlb:Invert Reflection Mask,ptin:_InvertReflectionMask,varname:node_9216,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7734-RGB,B-9211-OUT;n:type:ShaderForge.SFN_TexCoord,id:533,x:30719,y:31747,varname:node_533,prsc:2,uv:0;n:type:ShaderForge.SFN_Slider,id:4065,x:32169,y:33777,ptovrint:False,ptlb:_Transparency,ptin:__Transparency,varname:node_3421,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Lerp,id:2751,x:32439,y:33495,varname:node_2751,prsc:2|A-975-OUT,B-9357-OUT,T-4065-OUT;n:type:ShaderForge.SFN_Vector1,id:975,x:32196,y:33409,varname:node_975,prsc:2,v1:1;n:type:ShaderForge.SFN_Cubemap,id:3105,x:30553,y:32373,ptovrint:False,ptlb:_Cube map ,ptin:__Cubemap,varname:node_3326,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:1|MIP-1880-OUT;n:type:ShaderForge.SFN_Fresnel,id:7200,x:31274,y:32988,varname:node_7200,prsc:2|EXP-9497-OUT;n:type:ShaderForge.SFN_Slider,id:3949,x:30745,y:33301,ptovrint:False,ptlb:Cube map Edges,ptin:_CubemapEdges,varname:node_9228,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Lerp,id:6423,x:30884,y:32587,varname:node_6423,prsc:2|A-9588-OUT,B-689-OUT,T-5239-OUT;n:type:ShaderForge.SFN_Multiply,id:8149,x:31259,y:32544,varname:node_8149,prsc:2|A-3105-RGB,B-6423-OUT;n:type:ShaderForge.SFN_Slider,id:5239,x:30501,y:32750,ptovrint:False,ptlb:Cube map Intensity,ptin:_CubemapIntensity,varname:_ReflectionGlow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Vector1,id:9588,x:30608,y:32545,varname:node_9588,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:689,x:30608,y:32615,varname:node_689,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:4520,x:31854,y:32861,varname:node_4520,prsc:2|A-8149-OUT,B-490-OUT;n:type:ShaderForge.SFN_Lerp,id:9497,x:31134,y:33129,varname:node_9497,prsc:2|A-6096-OUT,B-8356-OUT,T-3949-OUT;n:type:ShaderForge.SFN_Vector1,id:6096,x:30902,y:32997,varname:node_6096,prsc:2,v1:10;n:type:ShaderForge.SFN_Vector1,id:8356,x:30902,y:33101,varname:node_8356,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:5000,x:31437,y:33188,varname:node_5000,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1|IN-7200-OUT;n:type:ShaderForge.SFN_Multiply,id:490,x:31607,y:32935,varname:node_490,prsc:2|A-7200-OUT,B-7200-OUT,C-5000-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:1880,x:30370,y:32440,varname:node_1880,prsc:2,a:0,b:6|IN-5836-OUT;n:type:ShaderForge.SFN_Slider,id:5836,x:29986,y:32461,ptovrint:False,ptlb:Blur Reflection,ptin:_BlurReflection,varname:node_5181,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_RemapRange,id:9848,x:31917,y:33591,varname:node_9848,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-7734-R;n:type:ShaderForge.SFN_SwitchProperty,id:9357,x:32196,y:33506,ptovrint:False,ptlb:Invert Transparency Mask,ptin:_InvertTransparencyMask,varname:_InvertMask_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7734-R,B-9848-OUT;n:type:ShaderForge.SFN_Vector3,id:5789,x:31588,y:31147,varname:node_5789,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:7548,x:31883,y:31375,varname:node_7548,prsc:2|A-5789-OUT,B-5129-OUT,T-9696-OUT;n:type:ShaderForge.SFN_Slider,id:9696,x:31672,y:31679,ptovrint:False,ptlb:Mask Intensity,ptin:_MaskIntensity,varname:node_9696,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_OneMinus,id:327,x:32316,y:30721,varname:node_327,prsc:2|IN-7533-A;n:type:ShaderForge.SFN_Blend,id:8222,x:32612,y:30917,varname:node_8222,prsc:2,blmd:1,clmp:True|SRC-327-OUT,DST-4520-OUT;n:type:ShaderForge.SFN_Multiply,id:1318,x:33292,y:30652,varname:node_1318,prsc:2|A-7533-RGB,B-1308-OUT,C-1556-RGB;n:type:ShaderForge.SFN_Add,id:1308,x:32877,y:30752,varname:node_1308,prsc:2|A-7533-A,B-8222-OUT;n:type:ShaderForge.SFN_Color,id:1556,x:32936,y:30319,ptovrint:False,ptlb:Color Tint,ptin:_ColorTint,varname:node_5257,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:5677,x:31492,y:32314,ptovrint:False,ptlb:Diffuse to white (Mirror Brightness),ptin:_DiffusetowhiteMirrorBrightness,varname:node_9856,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:6293,x:31761,y:32131,varname:node_6293,prsc:2|A-6144-RGB,B-4136-OUT;n:type:ShaderForge.SFN_Lerp,id:1186,x:32087,y:32164,varname:node_1186,prsc:2|A-6293-OUT,B-4136-OUT,T-5677-OUT;n:type:ShaderForge.SFN_Vector3,id:4136,x:31604,y:31933,varname:node_4136,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_OneMinus,id:1790,x:31448,y:30511,varname:node_1790,prsc:2|IN-9486-V;n:type:ShaderForge.SFN_Append,id:2487,x:31644,y:30378,varname:node_2487,prsc:2|A-9486-U,B-1790-OUT;proporder:1556-5677-7734-7533-9216-4598-9696-6144-3105-5239-5836-3949-4065-9357;pass:END;sub:END;*/

Shader "Ciconia Studio/Effects/MirrorReflection/Forward rendering/Diffuse" {
    Properties {
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        _DiffusetowhiteMirrorBrightness ("Diffuse to white (Mirror Brightness)", Range(0, 1)) = 0
        __Reflectionmask ("_Reflection mask", 2D) = "white" {}
        [HideInInspector]_ReflectionTex ("ReflectionTex", 2D) = "bump" {}
        [MaterialToggle] _InvertReflectionMask ("Invert Reflection Mask", Float ) = 0
        _MaskSpread ("Mask Spread", Range(0, 4)) = 0
        _MaskIntensity ("Mask Intensity", Range(0, 1)) = 1
        __Diffusemap ("_Diffuse map", 2D) = "white" {}
        __Cubemap ("_Cube map ", Cube) = "_Skybox" {}
        _CubemapIntensity ("Cube map Intensity", Range(0, 1)) = 0.3
        _BlurReflection ("Blur Reflection", Range(0, 1)) = 0
        _CubemapEdges ("Cube map Edges", Range(0, 1)) = 0.5
        __Transparency ("_Transparency", Range(0, 1)) = 0
        [MaterialToggle] _InvertTransparencyMask ("Invert Transparency Mask", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
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
            uniform float _BlurReflection;
            uniform fixed _InvertTransparencyMask;
            uniform float _MaskIntensity;
            uniform float4 _ColorTint;
            uniform float _DiffusetowhiteMirrorBrightness;
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
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD11;
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
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
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
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - 0;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float2 node_2487 = float2(sceneUVs.r,(1.0 - sceneUVs.g));
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(node_2487, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float4 __Reflectionmask_var = tex2D(__Reflectionmask,TRANSFORM_TEX(i.uv0, __Reflectionmask));
                float4 __Diffusemap_var = tex2D(__Diffusemap,TRANSFORM_TEX(i.uv0, __Diffusemap));
                float3 node_4136 = float3(1,1,1);
                float3 diffuseColor = (saturate((1.0-(1.0-(_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb))*(1.0-lerp(float3(1,1,1),lerp(float3(0,0,0),lerp( __Reflectionmask_var.rgb, (__Reflectionmask_var.rgb*-1.0+1.0), _InvertReflectionMask ),_MaskSpread),_MaskIntensity))))*lerp((__Diffusemap_var.rgb*node_4136),node_4136,_DiffusetowhiteMirrorBrightness));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
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
            uniform float _BlurReflection;
            uniform fixed _InvertTransparencyMask;
            uniform float _MaskIntensity;
            uniform float4 _ColorTint;
            uniform float _DiffusetowhiteMirrorBrightness;
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
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float2 node_2487 = float2(sceneUVs.r,(1.0 - sceneUVs.g));
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(node_2487, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float4 __Reflectionmask_var = tex2D(__Reflectionmask,TRANSFORM_TEX(i.uv0, __Reflectionmask));
                float4 __Diffusemap_var = tex2D(__Diffusemap,TRANSFORM_TEX(i.uv0, __Diffusemap));
                float3 node_4136 = float3(1,1,1);
                float3 diffuseColor = (saturate((1.0-(1.0-(_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb))*(1.0-lerp(float3(1,1,1),lerp(float3(0,0,0),lerp( __Reflectionmask_var.rgb, (__Reflectionmask_var.rgb*-1.0+1.0), _InvertReflectionMask ),_MaskSpread),_MaskIntensity))))*lerp((__Diffusemap_var.rgb*node_4136),node_4136,_DiffusetowhiteMirrorBrightness));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            uniform float _BlurReflection;
            uniform float _MaskIntensity;
            uniform float4 _ColorTint;
            uniform float _DiffusetowhiteMirrorBrightness;
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
                
                float2 node_2487 = float2(sceneUVs.r,(1.0 - sceneUVs.g));
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(node_2487, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float4 __Reflectionmask_var = tex2D(__Reflectionmask,TRANSFORM_TEX(i.uv0, __Reflectionmask));
                float4 __Diffusemap_var = tex2D(__Diffusemap,TRANSFORM_TEX(i.uv0, __Diffusemap));
                float3 node_4136 = float3(1,1,1);
                float3 diffColor = (saturate((1.0-(1.0-(_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb))*(1.0-lerp(float3(1,1,1),lerp(float3(0,0,0),lerp( __Reflectionmask_var.rgb, (__Reflectionmask_var.rgb*-1.0+1.0), _InvertReflectionMask ),_MaskSpread),_MaskIntensity))))*lerp((__Diffusemap_var.rgb*node_4136),node_4136,_DiffusetowhiteMirrorBrightness));
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
