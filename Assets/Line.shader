Shader "Custom/Line" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
	}
	SubShader {
		Tags {"Queue" = "Transparent" }
	    Pass {
	    	Blend SrcAlpha OneMinusSrcAlpha
	    	
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct v2f {
			    float4 pos : SV_POSITION;
			};
			
			float4 _Color;

			v2f vert (appdata_base v)
			{
			    v2f o;
			    o.pos = UnityObjectToClipPos (v.vertex);
			    return o;
			}

			half4 frag (v2f i) : COLOR
			{
			    return _Color;
			}
			ENDCG
		}
	}
	FallBack Off
}
