// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.21 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.21;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:True,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:2,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-5024-OUT,alpha-2751-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9486,x:30088,y:31134,varname:node_9486,prsc:2,sctp:2;n:type:ShaderForge.SFN_Tex2d,id:7533,x:30366,y:31158,ptovrint:False,ptlb:ReflectionTex,ptin:_ReflectionTex,varname:node_7533,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False|UVIN-9486-UVOUT;n:type:ShaderForge.SFN_Blend,id:6476,x:31226,y:31870,varname:node_6476,prsc:2,blmd:6,clmp:True|SRC-4344-OUT,DST-8243-OUT;n:type:ShaderForge.SFN_Slider,id:4065,x:31952,y:33613,ptovrint:False,ptlb:_Transparency,ptin:__Transparency,varname:node_3421,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Lerp,id:2751,x:32315,y:33319,varname:node_2751,prsc:2|A-975-OUT,B-4183-OUT,T-4065-OUT;n:type:ShaderForge.SFN_Vector1,id:975,x:32072,y:33233,varname:node_975,prsc:2,v1:1;n:type:ShaderForge.SFN_Cubemap,id:3105,x:30008,y:32769,ptovrint:False,ptlb:_Cube map ,ptin:__Cubemap,varname:node_3326,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:1|MIP-1880-OUT;n:type:ShaderForge.SFN_Fresnel,id:7200,x:30729,y:33384,varname:node_7200,prsc:2|EXP-9497-OUT;n:type:ShaderForge.SFN_Slider,id:3949,x:30200,y:33697,ptovrint:False,ptlb:Cube map Edges,ptin:_CubemapEdges,varname:node_9228,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Lerp,id:6423,x:30339,y:32983,varname:node_6423,prsc:2|A-9588-OUT,B-689-OUT,T-5239-OUT;n:type:ShaderForge.SFN_Multiply,id:8149,x:30587,y:32983,varname:node_8149,prsc:2|A-3105-RGB,B-6423-OUT;n:type:ShaderForge.SFN_Slider,id:5239,x:29956,y:33146,ptovrint:False,ptlb:Cube map Intensity,ptin:_CubemapIntensity,varname:_ReflectionGlow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3,max:1;n:type:ShaderForge.SFN_Vector1,id:9588,x:30063,y:32941,varname:node_9588,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:689,x:30063,y:33011,varname:node_689,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:4520,x:31209,y:32879,varname:node_4520,prsc:2|A-8149-OUT,B-490-OUT;n:type:ShaderForge.SFN_Lerp,id:9497,x:30589,y:33525,varname:node_9497,prsc:2|A-6096-OUT,B-8356-OUT,T-3949-OUT;n:type:ShaderForge.SFN_Vector1,id:6096,x:30357,y:33393,varname:node_6096,prsc:2,v1:10;n:type:ShaderForge.SFN_Vector1,id:8356,x:30357,y:33497,varname:node_8356,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:5000,x:30892,y:33584,varname:node_5000,prsc:2,frmn:0,frmx:1,tomn:0,tomx:1|IN-7200-OUT;n:type:ShaderForge.SFN_Multiply,id:490,x:31062,y:33331,varname:node_490,prsc:2|A-7200-OUT,B-7200-OUT,C-5000-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:1880,x:29825,y:32836,varname:node_1880,prsc:2,a:0,b:6|IN-5836-OUT;n:type:ShaderForge.SFN_Slider,id:5836,x:29441,y:32857,ptovrint:False,ptlb:Blur Reflection,ptin:_BlurReflection,varname:node_5181,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:1756,x:30358,y:32117,ptovrint:False,ptlb:Dirt Map (B&W),ptin:_DirtMapBW,varname:node_1756,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:8243,x:30857,y:32175,ptovrint:False,ptlb:Invert Dirt Map,ptin:_InvertDirtMap,varname:_InvertReflectionMask_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1756-RGB,B-9519-OUT;n:type:ShaderForge.SFN_RemapRange,id:9519,x:30621,y:32378,varname:node_9519,prsc:2,frmn:0,frmx:1,tomn:1,tomx:0|IN-1756-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:5024,x:32071,y:32125,ptovrint:False,ptlb:Active Dirt mask (B&W),ptin:_ActiveDirtmaskBW,varname:node_5024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4344-OUT,B-8898-OUT;n:type:ShaderForge.SFN_Vector1,id:4183,x:32072,y:33435,varname:node_4183,prsc:2,v1:0;n:type:ShaderForge.SFN_SwitchProperty,id:8898,x:31477,y:31974,ptovrint:False,ptlb:Mode Screen (Off)/Overlay (On),ptin:_ModeScreenOffOverlayOn,varname:node_8898,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-6476-OUT,B-9179-OUT;n:type:ShaderForge.SFN_Blend,id:9179,x:31226,y:32053,varname:node_9179,prsc:2,blmd:10,clmp:True|SRC-4344-OUT,DST-8243-OUT;n:type:ShaderForge.SFN_OneMinus,id:6572,x:30501,y:31454,varname:node_6572,prsc:2|IN-7533-A;n:type:ShaderForge.SFN_Blend,id:1440,x:30690,y:31666,varname:node_1440,prsc:2,blmd:1,clmp:True|SRC-6572-OUT,DST-4520-OUT;n:type:ShaderForge.SFN_Multiply,id:4344,x:31180,y:31242,varname:node_4344,prsc:2|A-7533-RGB,B-4387-OUT,C-953-RGB;n:type:ShaderForge.SFN_Add,id:4387,x:31077,y:31463,varname:node_4387,prsc:2|A-7533-A,B-1440-OUT;n:type:ShaderForge.SFN_Color,id:953,x:31069,y:30960,ptovrint:False,ptlb:Color Tint,ptin:_ColorTint,varname:node_5257,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;proporder:953-7533-5024-8898-1756-8243-3105-5239-5836-3949-4065;pass:END;sub:END;*/

Shader "Ciconia Studio/Effects/MirrorReflection/Deferred rendering/Fast Windows" {
    Properties {
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        [HideInInspector]_ReflectionTex ("ReflectionTex", 2D) = "bump" {}
        [MaterialToggle] _ActiveDirtmaskBW ("Active Dirt mask (B&W)", Float ) = 0.5
        [MaterialToggle] _ModeScreenOffOverlayOn ("Mode Screen (Off)/Overlay (On)", Float ) = 1
        _DirtMapBW ("Dirt Map (B&W)", 2D) = "white" {}
        [MaterialToggle] _InvertDirtMap ("Invert Dirt Map", Float ) = 1
        __Cubemap ("_Cube map ", Cube) = "_Skybox" {}
        _CubemapIntensity ("Cube map Intensity", Range(0, 1)) = 0.3
        _BlurReflection ("Blur Reflection", Range(0, 1)) = 0
        _CubemapEdges ("Cube map Edges", Range(0, 1)) = 0.5
        __Transparency ("_Transparency", Range(0, 1)) = 0.5
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
            uniform sampler2D _ReflectionTex; uniform float4 _ReflectionTex_ST;
            uniform float __Transparency;
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _BlurReflection;
            uniform sampler2D _DirtMapBW; uniform float4 _DirtMapBW_ST;
            uniform fixed _InvertDirtMap;
            uniform fixed _ActiveDirtmaskBW;
            uniform fixed _ModeScreenOffOverlayOn;
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
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
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
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(sceneUVs.rg, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float3 node_4344 = (_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb);
                float4 _DirtMapBW_var = tex2D(_DirtMapBW,TRANSFORM_TEX(i.uv0, _DirtMapBW));
                float3 _InvertDirtMap_var = lerp( _DirtMapBW_var.rgb, (_DirtMapBW_var.rgb*-1.0+1.0), _InvertDirtMap );
                float3 diffuseColor = lerp( node_4344, lerp( saturate((1.0-(1.0-node_4344)*(1.0-_InvertDirtMap_var))), saturate(( _InvertDirtMap_var > 0.5 ? (1.0-(1.0-2.0*(_InvertDirtMap_var-0.5))*(1.0-node_4344)) : (2.0*_InvertDirtMap_var*node_4344) )), _ModeScreenOffOverlayOn ), _ActiveDirtmaskBW );
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,lerp(1.0,0.0,__Transparency));
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
            uniform sampler2D _ReflectionTex; uniform float4 _ReflectionTex_ST;
            uniform float __Transparency;
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _BlurReflection;
            uniform sampler2D _DirtMapBW; uniform float4 _DirtMapBW_ST;
            uniform fixed _InvertDirtMap;
            uniform fixed _ActiveDirtmaskBW;
            uniform fixed _ModeScreenOffOverlayOn;
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
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(sceneUVs.rg, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float3 node_4344 = (_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb);
                float4 _DirtMapBW_var = tex2D(_DirtMapBW,TRANSFORM_TEX(i.uv0, _DirtMapBW));
                float3 _InvertDirtMap_var = lerp( _DirtMapBW_var.rgb, (_DirtMapBW_var.rgb*-1.0+1.0), _InvertDirtMap );
                float3 diffuseColor = lerp( node_4344, lerp( saturate((1.0-(1.0-node_4344)*(1.0-_InvertDirtMap_var))), saturate(( _InvertDirtMap_var > 0.5 ? (1.0-(1.0-2.0*(_InvertDirtMap_var-0.5))*(1.0-node_4344)) : (2.0*_InvertDirtMap_var*node_4344) )), _ModeScreenOffOverlayOn ), _ActiveDirtmaskBW );
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * lerp(1.0,0.0,__Transparency),0);
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
            uniform sampler2D _ReflectionTex; uniform float4 _ReflectionTex_ST;
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _BlurReflection;
            uniform sampler2D _DirtMapBW; uniform float4 _DirtMapBW_ST;
            uniform fixed _InvertDirtMap;
            uniform fixed _ActiveDirtmaskBW;
            uniform fixed _ModeScreenOffOverlayOn;
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
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(sceneUVs.rg, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float3 node_4344 = (_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,2.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*1.0+0.0))))))*_ColorTint.rgb);
                float4 _DirtMapBW_var = tex2D(_DirtMapBW,TRANSFORM_TEX(i.uv0, _DirtMapBW));
                float3 _InvertDirtMap_var = lerp( _DirtMapBW_var.rgb, (_DirtMapBW_var.rgb*-1.0+1.0), _InvertDirtMap );
                float3 diffColor = lerp( node_4344, lerp( saturate((1.0-(1.0-node_4344)*(1.0-_InvertDirtMap_var))), saturate(( _InvertDirtMap_var > 0.5 ? (1.0-(1.0-2.0*(_InvertDirtMap_var-0.5))*(1.0-node_4344)) : (2.0*_InvertDirtMap_var*node_4344) )), _ModeScreenOffOverlayOn ), _ActiveDirtmaskBW );
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
