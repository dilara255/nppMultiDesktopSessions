TODO: Small description of what this does;
TODO: Add open license;

This expects you to have:
- A base installation or portable copy of npp;
	TODO: Only actually tested for portable on portable;
- A folder inside that, called _MultiDesktop, which has a portable version of npp;
- Some version of Windows.

* Simply copy the _DefaultSettings folder into the _MultiDesktop folder.
* To create new independent sessions, refer to the files in Base\_MultiDesktop\_DefaultSettings.

* To get a context menu entry to open notepad++ as notepad, but with tabs, see "npp_stdal_context.reg". A modified icon is provided as notepad++_stdal.ico.

=> REMEMBER TO MODIFY THE PATHS IN "npp_stdal_context.reg" AND "openNotes.bat" if you use them.

* You may want to change shortcuts / taskbar icons adding the arguments -multiInst (to force open on a new instance) and/or -nosession (to prevent from opening the previous closed files).

* Finally, the "Customization" folder has suggested settings for this usage. To apply them, simply copy the contents of the folder into your base npp folder. In principle you can mix and match what you copy as well, but you milage may vary.
	TODO: Test that all the basic expected functionality is actually there if you don't copy anything over a default portable version of npp;



