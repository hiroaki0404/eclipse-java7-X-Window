# eclipse-java7-X-Window
Docker Machineを使用した、Eclipseの実行環境です。  
コンテナ上でX ClientのEclipseを動かし、手元のマシンまでsshで転送します。  
手元の/Usersが共有されて、Eclipseからも/Usersでアクセスできます(Mac)。  
VMの名称は"dev"を想定しています。
コンテナ上のアカウントは、docker/dockerです。

scriptディレクトリには、起動用script(docker-start-container)と接続用script(docker-x)があります。使い方は、見ればわかると思うので、略。

開発はMac版Virtual Boxです。