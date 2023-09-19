<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class leaderproduct extends Model
{
    use HasFactory;
    protected $table= "tblproduct";
    protected $fillable = [
        // id for product
        'proid',
        'catid',
        ];
        public function conncetdata(){
            return $this->hasMany(conncetdata::class, 'categoryid', 'catid ');
        }
}
