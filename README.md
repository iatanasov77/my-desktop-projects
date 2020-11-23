Vagrant Desktop-Development
==============================
Used `https://github.com/awinterstein/vagrant-qt-dev` as base but made some usefull changes

* The source folder is changed outside of this repository and mounted as synced folder
* Added Additional ansible playbook `vs_playbook.yml` that install QxOrm as QT ORM library and add mysql driver to the qt
* Install mysql server to can used with apps

NOTE: For more info read the comments and instructions here `https://github.com/awinterstein/vagrant-qt-dev`
