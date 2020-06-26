<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default filesystem disk that should be used
    | by the framework. The "local" disk, as well as a variety of cloud
    | based disks are available to your application. Just store away!

    | Aqui você pode especificar o disco do sistema de arquivos padrão que deve ser usado
    | pela estrutura. O disco "local", bem como uma variedade de nuvens
    | discos baseados em disco estão disponíveis para seu aplicativo. Apenas guarde!
    |
    */

    'default' => env('FILESYSTEM_DRIVER', 'local'),

    /*
    |--------------------------------------------------------------------------
    | Default Cloud Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Many applications store files both locally and in the cloud. For this
    | reason, you may specify a default "cloud" driver here. This driver
    | will be bound as the Cloud disk implementation in the container.

    | Muitos aplicativos armazenam arquivos localmente e na nuvem. Por esta
    | Por esse motivo, você pode especificar um driver "nuvem" padrão aqui. Esse driver
    | será vinculado como a implementação do disco na nuvem no contêiner.
    |
    */

    'cloud' => env('FILESYSTEM_CLOUD', 's3'),

    /*
    |--------------------------------------------------------------------------
    | Filesystem Disks
    |--------------------------------------------------------------------------
    |
    | Here you may configure as many filesystem "disks" as you wish, and you
    | may even configure multiple disks of the same driver. Defaults have
    | been setup for each driver as an example of the required options.
    |
    | Supported Drivers: "local", "ftp", "sftp", "s3"

    | Aqui você pode configurar quantos "discos" do sistema de arquivos desejar e
    | pode até configurar vários discos do mesmo driver. Os padrões têm
    | foi configurado para cada driver como um exemplo das opções necessárias.
    |
    | Drivers suportados: "local", "ftp", "sftp", "s3"
    |
    */

    'disks' => [
        
        //Salva na pasta storage/app
        'local' => [
            'driver' => 'local',
            'root' => storage_path('app'),
        ],

        //Salva na pasta storage/app/public
        'public' => [
            'driver' => 'local',
            'root' => storage_path('app/public'),
            'url' => env('APP_URL').'/storage',
            'visibility' => 'public',
        ],

        's3' => [
            'driver' => 's3',
            'key' => env('AWS_ACCESS_KEY_ID'),
            'secret' => env('AWS_SECRET_ACCESS_KEY'),
            'region' => env('AWS_DEFAULT_REGION'),
            'bucket' => env('AWS_BUCKET'),
            'url' => env('AWS_URL'),
            'endpoint' => env('AWS_ENDPOINT'),
        ],

    ],

];
