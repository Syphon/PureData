PureData
========

Syphon Implementation for Pure Data / GEM


Alpha
========

Current implementation supports a single Server only.


Installation Instructions
============

* Download PD Extended 0.43.4 or greater.
* Install PD Extended into your /Applications folder.
* Download Syphon for PD Alpha 3
* Navigate to your PD Extended Application, and 'Show Package Contents'
* Navigate within the PD Extended Application to PD Extended.app/Contents/Plugins/Gem/ and copy both syphon server.pd_darwin and Syphon.framework into the Gem folder.

Your Gem folder should look similar to:

![screen shot 2015-06-12 at 5 45 33 pm](https://cloud.githubusercontent.com/assets/65011/8140601/0d470c5e-112b-11e5-8315-80d78e6b4023.png)

Launch PD Extended.

Compilation
=====

Ensure that Pure Data Extended is installed to /Applications, so that the latest GEM library is automatically found to be linked against. That is the only requirement.
