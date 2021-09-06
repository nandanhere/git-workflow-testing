# Throw away repo
repo to test out the android build workflow for kivy
### What Works:
- Building the apk, though it takes 15+ mins
### TO DO
- possibly shift to using python-for-android

### NOTE: .spec files and how to configure
- Empty the src folder and add your kivy files there.
- In build folder -> android -> buildozer.spec file,
- - Add the appropriate permissions such as internal and external storage access, and filetypes such as wav in the case of kivySnake. Refer to example provided in src folder
- Change the name of the application to the one you want. however you must keep package.name the same as the name in the build.yml file 
<hr>
Inspired by the cross platform gui workflow by [@maltfield](https://github.com/maltfield)
