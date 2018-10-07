<?php

namespace App\Http\Controllers;

use App\Education;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Job;
use App\Certificate;
use Illuminate\Support\Facades\Hash;
use Auth;

class SettingsController extends Controller
{
    //Education
    public function Education(Request $req){
        return auth()->user()->education;
//        return Education::all()->where('user_id', $req->id);
    }

    public function addEducation(Request $req)
    {
        $education = new Education;
        $education->name = $req->name;
        $education->institution = $req->institution;
        $education->start_date = $req->start_date;
        $education->end_date = $req->end_date;
        $education->description = $req->description;
        auth()->user()->education()->save($education);
        return response()->json($education);
    }

    public function editEducation(Education $education,Request $req)
    {
        $education->name = $req->name;
        $education->institution = $req->institution;
        $education->start_date = $req->start_date;
        $education->end_date = $req->end_date;
        $education->description = $req->description;
        auth()->user()->education()->save($education);
        return response()->json($education);
    }

    //Job
    public function jobs(Request $req){
        return auth()->user()->jobs;
//        return Job::all()->where('user_id', $req->id);
    }

    public function addJobs(Request $req)
    {
        $job = new Job;
        $job->name = $req->name;
        $job->institution = $req->institution;
        $job->start_date = Carbon::createFromFormat('d/m/Y', $req->start_date)->toDateString();
        $job->end_date = Carbon::createFromFormat('d/m/Y', $req->end_date)->toDateString();
        $job->description = $req->description;
        auth()->user()->jobs()->save($job);
        return response()->json($job);
    }

    public function editJobs(Jobs $job,Request $req)
    {
        $job->name = $req->name;
        $job->institution = $req->institution;
        $job->start_date = Carbon::createFromFormat('d/m/Y', $req->start_date)->toDateString();
        $job->end_date = Carbon::createFromFormat('d/m/Y', $req->end_date)->toDateString();
        $job->description = $req->description;
        auth()->user()->jobs()->save($job);
        return response()->json($job);
    }

    //Certificates
    public function Certificates(Request $req){
        return auth()->user()->certificates;
//        return Certificate::all()->where('user_id', $req->id);
    }

    public function addCertificates(Request $req)
    {
        $certificate = new Certificate;
        $certificate->name = $req->name;
        $certificate->from = $req->from;
        $certificate->received_date = Carbon::createFromFormat('d/m/Y', $req->received_date)->toDateString();
        $certificate->description = $req->description;
        auth()->user()->certificates()->save($certificate);
        return response()->json($certificate);
    }

    public function editCertificates(Certificate $certificate,Request $req)
    {
        $certificate->name = $req->name;
        $certificate->institution = $req->institution;
        $certificate->start_date = Carbon::createFromFormat('d/m/Y', $req->start_date)->toDateString();
        $certificate->end_date = Carbon::createFromFormat('d/m/Y', $req->end_date)->toDateString();
        $certificate->description = $req->description;
        auth()->user()->certificates()->save($certificate);
        return response()->json($certificate);
    }

    //Security
    public function security(Request $request){
        $user = auth()->user();

        /*
        * Validate all input fields
        */
        $oldpassword = $request->get('oldpassword');
        if (Hash::check($oldpassword, $user->password))
        { 
        
            $newpassword = $request->get('newpassword');
    
            $user->update(['password' => Hash::make($newpassword)]);
            
            return response()->json(['success' => 'Successfully saved']);
            
        }else{
            return response()->json(['error' => 'Password does not match'],404);
        }
        
    }
}
