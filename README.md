Vagrant Desktop-Development
==============================
Used `https://github.com/awinterstein/vagrant-qt-dev` as base but made some usefull changes

* The source folder is changed outside of this repository and mounted as synced folder
* Added Additional ansible playbook `vs_playbook.yml` that install QxOrm as QT ORM library and add mysql driver to the qt
* Install mysql server to can used with apps

Examples how to use linuxdeployqt tool:
```
vs-linuxdeployqt QVocabulary -unsupported-allow-new-glibc -exclude-libs="libqsqlpsql,libqsqlmysql" -bundle-non-qt-libs
vs-linuxdeployqt QVocabulary -unsupported-allow-new-glibc -exclude-libs="libqsqlpsql,libqsqlmysql" -bundle-non-qt-libs -appimage -always-overwrite
vs-linuxdeployqt QVocabulary -exclude-libs="libqsqlpsql,libqsqlmysql" -bundle-non-qt-libs
```

NOTE: For more info read the comments and instructions here `https://github.com/awinterstein/vagrant-qt-dev`

Also here is added cross compilation oportunity to compile QT apps for Windows. To do this run: sudo vs-cross-compile-qt.sh
This will compile qt for windows and then you can enter you project dir: cd /path/to/your/project
and Run: qmake-mingw && make

To compile project for Windows run:
```
sudo vs-cross-compile-qt.sh
```
After that into the project dir run:
```
make clean
qmake-mingw
make
```
