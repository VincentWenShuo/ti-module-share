ti-module-share
===========================================
Titanium module to open IOS share activity window
Currently it only supports sharing text content.

![Alt text](/assets/IMG_0062.PNG?raw=true "Optional Title")
![Alt text](/assets/IMG_0063.PNG?raw=true "Optional Title")
![Alt text](/assets/IMG_0064.PNG?raw=true "Optional Title")

How to use
------------
1. Add module to your titanium project
2. Call 

{
	require('ti.module.share’).share({
		text: "default share content",
		facebook: "facebook share content",
		twitter: "twitter share content",
		callback: function( res ){
			if( res.state == "SUCCESS"){
			
			}
			else{
			
			}
		}	
	});
}

3. 

Cheers!
