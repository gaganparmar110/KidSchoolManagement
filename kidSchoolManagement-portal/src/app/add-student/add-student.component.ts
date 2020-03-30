import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, Validators} from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.css']
})
export class AddStudentComponent implements OnInit {
   studentFormGroup:FormGroup;
   result:any;
   readonly rootURL = 'https://localhost:44323/api';
  constructor(private formBuilder:FormBuilder,private httpService: HttpClient) { }

  ngOnInit(): void {
    this.studentFormGroup=this.formBuilder.group({
      fatherName:['',Validators.required],
      motherName:['',Validators.required],
      mobileNo:['',Validators.required],
      address:['',Validators.required],
      studentName:['',Validators.required],
      studentAge:['',Validators.required]
     
    })
  }

  submit(){
    console.log({FatherName:this.studentFormGroup.controls.fatherName.value});
    this.httpService.post(this.rootURL+'/students',{FatherName:this.studentFormGroup.controls.fatherName.value,MotherName:this.studentFormGroup.controls.motherName.value,MobileNo:this.studentFormGroup.controls.mobileNo.value,Address:this.studentFormGroup.controls.address.value,StudentName:this.studentFormGroup.controls.studentName.value,Age:this.studentFormGroup.controls.age.value}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
    
      
    })
  }

}
