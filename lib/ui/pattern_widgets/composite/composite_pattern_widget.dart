import 'package:flutter/material.dart';

import 'components/audio_file.dart';
import 'components/directory.dart';
import 'components/image_file.dart';
import 'components/text_file.dart';
import 'components/video_file.dart';

class CompositePatternWidget extends StatelessWidget {
  Widget buildMediaDirectory() {
    final musicDirectory = Directory(title: 'Music');
    musicDirectory.addFile(AudioFile('Metallica - one.mp3', 2612453));
    musicDirectory.addFile(AudioFile('Queen - we will rock you.mp3', 3219811));
    musicDirectory
        .addFile(AudioFile('ОУ74 - ЗаYeahPeace.mp3', 3811214));

    final moviesDirectory = Directory(title: 'Movies');

    moviesDirectory.addFile(VideoFile('South park 1 season.mp4', 951495532));
    moviesDirectory
        .addFile(VideoFile('Pulp fiction.mp4', 1251495532));

    final catPicturesDirectory = Directory(title: 'Dog');
    catPicturesDirectory.addFile(ImageFile('Dog 1.jpg', 844497));
    catPicturesDirectory.addFile(ImageFile('Dog 2.jpg', 975363));
    catPicturesDirectory.addFile(ImageFile('Dog 3.png', 1975363));

    final picturesDirectory = Directory(title: 'Pictures');
    picturesDirectory.addFile(catPicturesDirectory);
    picturesDirectory.addFile(ImageFile('meme.png', 2971361));

    final mediaDirectory = Directory(title: 'Media', isInitiallyExpanded: true);
    mediaDirectory.addFile(musicDirectory);
    mediaDirectory.addFile(moviesDirectory);
    mediaDirectory.addFile(picturesDirectory);
    mediaDirectory.addFile(Directory(title: 'New Folder'));
    mediaDirectory
        .addFile(TextFile('passwords.txt', 430791));
    mediaDirectory.addFile(TextFile('readme.txt', 1042));

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: buildMediaDirectory(),
      ),
    );
  }
}
