# http://www.phpied.com/installing-jpegtran-mac-unix-linux/
wget -c http://www.ijg.org/files/jpegsrc.v6b.tar.gz
tar zxfv jpegsrc.v6b.tar.gz
cd jpeg-6b
./configure && make && make install

apt install yasm nasm
wget -c http://ffmpeg.org/releases/ffmpeg-3.4.tar.bz2
tar jxfv ffmpeg-3.4.tar.bz2
cd ffmpeg-3.4
./configure && make && make install