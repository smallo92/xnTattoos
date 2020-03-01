**xnTattoos**

ESX Tattoo Shop using all the available GTA Online tattoos with correct names and configured pricing

**Installation**

Copy xnTattoos to your resources folder and add `start xnTattoos` to your server.cfg

**Customisation**

All the tattos are stored in the `AllTattoos.json` file, these are ripped directly from V thanks to ![root-cause](https://github.com/root-cause)
The prices of the tattoos are being divided by 20 otherwise they would all be massively expensive, so if you plan to change the prices keep that in mind unless you plan to change the script itself
All tattoo names are stored text labels inside the game, so if you plan to add custom tattoos make sure it has a matching label being created with `AddTextEntry()`
Categories are defined by the `Zone` entry in the json and the DLC they come from is defined by `Collection` although it isn't used

**Dependencies**

Obviously this needs `ESX` and `mysql-async`

![Video Demo](https://spandauballet.gold/i/Y1ouh2m.mp4)
![Inside Menu](https://fuckingyourmum.com/i/na8Dax.jpg)