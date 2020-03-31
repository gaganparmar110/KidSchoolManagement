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
    let age:number=this.studentFormGroup.value.age;
    let mobile:number=this.studentFormGroup.value.mobileNo;
   // console.log({FatherName:this.studentFormGroup.controls.fatherName.value});
    this.httpService.post<any>(this.rootURL+'/students',{fatherName:this.studentFormGroup.value.fatherName,motherName:this.studentFormGroup.value.motherName,mobileNo:mobile,address:this.studentFormGroup.value.address,studentName:this.studentFormGroup.value.studentName,age:age}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
    
      
    })
  }

}
