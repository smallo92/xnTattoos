**xnTattoos**

ESX Tattoo Shop using all the available GTA Online tattoos with correct names and configured pricing. You can select parts of the body and apply multiple tattoos to each area, change the opacity of the tattoos, rotate the camera to see them from multiple angles and even remove tattoos. 

**Installation**

Add tattoos.sql to your database if you don't already have a tattoos field in your `users` table (or update the `VARCHAR(255)` to `LONGTEXT` to prevent errors of having too many tattoos

Copy xnTattoos to your resources folder and add `start xnTattoos` to your server.cfg

**Customisation**

All the tattos are stored in the `AllTattoos.json` file, these are ripped directly from V thanks to [root-cause](https://github.com/root-cause)

The prices of the tattoos are being divided by 20 otherwise they would all be massively expensive, so if you plan to change the prices keep that in mind unless you plan to change the script itself

All tattoo names are stored text labels inside the game, so if you plan to add custom tattoos make sure it has a matching label being created with `AddTextEntry()`

Categories are defined by the `Zone` entry in the json and the DLC they come from is defined by `Collection` which is used to load the correct textures

**Dependencies**

Obviously this needs `ESX` and `mysql-async`
Another dependency is `JayMenu` which is currently included in this release until it is actually fully released by [Jaymo](https://github.com/jaymo1011)

**Known Issues**

Sometime the camera goes into the wrong spot. Leave the menu and re-enter it to fix that.

Head Blend Data is memed on OneSync so the tattoos try and reapply themselves every 5 minutes to counter that (maybe)

[Video Demo](https://spandauballet.gold/i/Y1ouh2m.mp4)

![Inside Menu](https://fuckingyourmum.com/i/na8Dax.jpg)