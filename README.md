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
2. Call require('ma.car.ti.module.share’).share({
	text: "share carma!",
	callback: function(res){
		if( res.state === "SUCCESS" ){
			console.log( "share successed" );
		}
		else{
			console.log( "share failed" );
		}
	}
});
3 Return data should be like this 
{
	completed = 0;
	shareType = mail;
	state = SUCCESS;
}

Cheers!
