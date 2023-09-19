<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;
    protected $table="tblcategory";
    protected $fillable = [
        'proid',
        'catid',
        'title'
        ];
        public function usertable()
        {
            return $this->belongsTo(usertable::class);
        }
}
