<?php

namespace App\Listeners;

use App\Common\Functions;
use App\Events\UserEvent;
use App\User;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Log;
use Excel;

class UserEventListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  UserEvent $event
     * @return void
     */
    public function handle(UserEvent $event)
    {
        Log::info('event start');
        $filePath = $event->filePath;
        Log::info("event filePath " . $filePath);
        Excel::load($filePath, function ($reader) {
            $reader = $reader->getSheet(0);
            $data = $reader->toArray();
            $count = count($data);
            for ($i=1;$i<$count;$i++){
                $row = $data[$i];
                $name = $row[0];
                $nameExist = User::where("name",$name)->first();
                if(!is_null($nameExist)){
                    continue;
                }
                $email = $row[1];
                $emailExist = User::where("email",$email)->first();
                if(!is_null($emailExist)){
                    continue;
                }
                $user = new User();
                $user->name = $name;
                $user->email = $email;
                $user->save();
            }

        });

        Log::info('event end');
        Functions::delFile($filePath);
        return;
    }
}
