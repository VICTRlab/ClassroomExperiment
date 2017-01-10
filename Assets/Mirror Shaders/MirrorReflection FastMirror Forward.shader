// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:True,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:False,qofs:0,qpre:2,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-4077-OUT;n:type:ShaderForge.SFN_Tex2d,id:7533,x:31571,y:32028,ptovrint:False,ptlb:ReflectionTex,ptin:_ReflectionTex,varname:node_7533,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2913-OUT;n:type:ShaderForge.SFN_Cubemap,id:3105,x:30889,y:32309,ptovrint:False,ptlb:_Cube map ,ptin:__Cubemap,varname:node_3326,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:1|MIP-1880-OUT;n:type:ShaderForge.SFN_Fresnel,id:7200,x:31274,y:32988,varname:node_7200,prsc:2|EXP-9497-OUT;n:type:ShaderForge.SFN_Slider,id:3949,x:30745,y:33301,ptovrint:False,ptlb:Cube map Edges,ptin:_CubemapEdges,varname:node_9228,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Lerp,id:6423,x:30872,y:32540,varname:node_6423,prsc:2|A-9588-OUT,B-689-OUT,T-5239-OUT;n:type:ShaderForge.SFN_Multiply,id:8149,x:31132,y:32587,varname:node_8149,prsc:2|A-3105-RGB,B-6423-OUT;n:type:ShaderForge.SFN_Slider,id:5239,x:30501,y:32750,ptovrint:False,ptlb:Cube map Intensity,ptin:_CubemapIntensity,varname:_ReflectionGlow_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:9588,x:30608,y:32545,varname:node_9588,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:689,x:30608,y:32615,varname:node_689,prsc:2,v1:3;n:type:ShaderForge.SFN_Lerp,id:9497,x:31134,y:33129,varname:node_9497,prsc:2|A-6096-OUT,B-8356-OUT,T-3949-OUT;n:type:ShaderForge.SFN_Vector1,id:6096,x:30902,y:32997,varname:node_6096,prsc:2,v1:10;n:type:ShaderForge.SFN_Vector1,id:8356,x:30902,y:33101,varname:node_8356,prsc:2,v1:1;n:type:ShaderForge.SFN_RemapRange,id:5000,x:31437,y:33188,varname:node_5000,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-7200-OUT;n:type:ShaderForge.SFN_Multiply,id:490,x:31614,y:33070,varname:node_490,prsc:2|A-7200-OUT,B-7200-OUT,C-5000-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:1880,x:30635,y:32271,varname:node_1880,prsc:2,a:0,b:6|IN-5836-OUT;n:type:ShaderForge.SFN_Slider,id:5836,x:30240,y:32234,ptovrint:False,ptlb:Blur Reflection,ptin:_BlurReflection,varname:node_5181,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:285,x:31767,y:32619,varname:node_285,prsc:2|A-8149-OUT,B-490-OUT;n:type:ShaderForge.SFN_OneMinus,id:7130,x:31818,y:32388,varname:node_7130,prsc:2|IN-7533-A;n:type:ShaderForge.SFN_Blend,id:5882,x:32097,y:32481,varname:node_5882,prsc:2,blmd:1,clmp:True|SRC-7130-OUT,DST-285-OUT;n:type:ShaderForge.SFN_Multiply,id:4077,x:32533,y:32038,varname:node_4077,prsc:2|A-7533-RGB,B-956-OUT,C-5257-RGB;n:type:ShaderForge.SFN_Add,id:956,x:32251,y:32322,varname:node_956,prsc:2|A-7533-A,B-5882-OUT;n:type:ShaderForge.SFN_Color,id:5257,x:32298,y:31725,ptovrint:False,ptlb:Color Tint,ptin:_ColorTint,varname:node_5257,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ScreenPos,id:2067,x:30965,y:31763,varname:node_2067,prsc:2,sctp:2;n:type:ShaderForge.SFN_OneMinus,id:2920,x:31159,y:31938,varname:node_2920,prsc:2|IN-2067-V;n:type:ShaderForge.SFN_Append,id:2913,x:31355,y:31805,varname:node_2913,prsc:2|A-2067-U,B-2920-OUT;proporder:5257-7533-3105-5239-5836-3949;pass:END;sub:END;*/

Shader "Ciconia Studio/Effects/MirrorReflection/Forward rendering/Fast Mirror" {
    Properties {
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        [HideInInspector]_ReflectionTex ("ReflectionTex", 2D) = "white" {}
        __Cubemap ("_Cube map ", Cube) = "_Skybox" {}
        _CubemapIntensity ("Cube map Intensity", Range(0, 1)) = 1
        _BlurReflection ("Blur Reflection", Range(0, 1)) = 0
        _CubemapEdges ("Cube map Edges", Range(0, 1)) = 0.5
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
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _BlurReflection;
            uniform float4 _ColorTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                float4 screenPos : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                float2 node_2913 = float2(sceneUVs.r,(1.0 - sceneUVs.g));
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(node_2913, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float3 diffuseColor = (_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,3.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*0.5+0.5))))))*_ColorTint.rgb);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            uniform samplerCUBE __Cubemap;
            uniform float _CubemapEdges;
            uniform float _CubemapIntensity;
            uniform float _BlurReflection;
            uniform float4 _ColorTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                float4 screenPos : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                float2 node_2913 = float2(sceneUVs.r,(1.0 - sceneUVs.g));
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(node_2913, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float3 diffuseColor = (_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,3.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*0.5+0.5))))))*_ColorTint.rgb);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
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
            uniform float4 _ColorTint;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 screenPos : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                
                float2 node_2913 = float2(sceneUVs.r,(1.0 - sceneUVs.g));
                float4 _ReflectionTex_var = tex2D(_ReflectionTex,TRANSFORM_TEX(node_2913, _ReflectionTex));
                float node_7200 = pow(1.0-max(0,dot(normalDirection, viewDirection)),lerp(10.0,1.0,_CubemapEdges));
                float3 diffColor = (_ReflectionTex_var.rgb*(_ReflectionTex_var.a+saturate(((1.0 - _ReflectionTex_var.a)*((texCUBElod(__Cubemap,float4(viewReflectDirection,lerp(0,6,_BlurReflection))).rgb*lerp(0.0,3.0,_CubemapIntensity))+(node_7200*node_7200*(node_7200*0.5+0.5))))))*_ColorTint.rgb);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
