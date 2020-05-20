---
layout: post
title: "How To Install Anope Service In Centos 7"
date: 2018-04-15
categories: anope
---
<div align="center">
    <img src="http://www.anope.org/cpanel/static/logo.png">
</div>

Halo, kali ini kita akan menginstall Service Anope di OS Centos 7.
Pertama, kita harus install Development Tools dulu dan beberapa tools yang diperlukan, 
> yum group install "Development Tools"
> 
> yum install make cmake openssl openssl-devel 

Kemudian, kita download source Anope nya 

> wget https://github.com/anope/anope/releases/download/2.0.6/anope-2.0.6-source.tar.gz

Terus, kita extract dan masuk ke directory hasil extract tadi.
> tar -zxvf anope* && cd anope*

Lalu jalankan perintah `./extras` dan enable-kan `m_ssl_openssl.cpp` 
<div align="center">
    <img src="https://raw.githubusercontent.com/havidzc0de/havidzc0de.github.io/master/assets/images/m_ssl_openssl.cpp.png">
</div>


Terus `./Config` dan install anope nya menggunkan user biasa/bukan root.
> ./Config
> 
> cd build && make && make install

Enter-enter sampe selesai.
Seletah berhasil diinstall, maka directory anope sekarang ada di home directory `~/services` , lalu uncoment module `m_ssl_openssl` di `~/services/conf/modules.example.conf`

> vim ~/services/conf/modules.example.conf

Buat file konfigurasi Anopenya _kita pake file examplenya_
> cp ~/services/conf/example.conf ~/services/conf/services.conf

Lalu edit file konfiurasi tadi sesuai kebutuhan. Untuk contoh, bisa lihat file konfigurasi milik saya disini [services.conf](https://raw.githubusercontent.com/havidzc0de/havidzc0de.github.io/master/assets/files/services.conf), kebetulan untuk aplikasi IRC yg saya gunakan adalah Unrealircd.

``Note:`` Edit juga bagian konfigurasi link `unrealircd.conf`, sesuaikan dengan konfigurasi uplink di `services.conf`:
{% highlight ruby %}
link services.mynet.org
{
    incoming {
        mask 127.0.0.1;
    };

    password "changemeplease";

    class servers;
};
{% endhighlight ruby %}

Serverinfo juga disesuaikan :

{% highlight ruby %}
serverinfo
{
    /*
     * The hostname that Services will be seen as, it must have no conflicts with any
     * other server names on the rest of your IRC network. Note that it does not have
     * to be an existing hostname, just one that isn't on your network already.
     */
    name = "127.0.0.1"

{% endhighlight ruby %}

Kalau sudah beres konfigurasi, jalankan dengan perintah 
> ./services/bin/anoperc start

<div align="center">
    <img src="https://raw.githubusercontent.com/havidzc0de/havidzc0de.github.io/master/assets/images/start.png">
</div>

Sampai disini service Anope siap digunakan, sekian dan terimakasih.






