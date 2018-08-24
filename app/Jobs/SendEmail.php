<?php

namespace App\Jobs;

use App\Common\Functions;
use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Mail;
use Log;
use Excel;

class SendEmail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $file;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($file)
    {
        $this->file = $file;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        set_time_limit(0);
        Log::info("queue start");
        Log::info("file ".$this->file);
        $filePath = $this->file;
        Excel::load($filePath, function ($reader) {
            $reader = $reader->getSheet(0);
            $data = $reader->toArray();
            $count = count($data);
            for ($i=0;$i<$count;$i++){
                $title = $data[0];
                $row = $data[$i];
                $name = $row[1];
                $month = $row[0];
                $nameExist = User::where("name",$name)->first();
                if(is_null($nameExist)){
                    continue;
                }else{
                    $email = $nameExist->email;
                    Mail::send("email.reminder",[
                        'title'=>$title,'content'=>$row
                    ],function ($mail) use ($name,$email,$month){
                        $mail->to($email,$name)->subject($month."工资通知");
                    });
                }
            }

        });

        Log::info('queue end');
        Functions::delFile($filePath);
        return;
    }
}
