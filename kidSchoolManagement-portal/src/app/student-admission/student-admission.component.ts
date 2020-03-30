import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder, Validators} from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http';
@Component({
  selector: 'app-student-admission',
  templateUrl: './student-admission.component.html',
  styleUrls: ['./student-admission.component.css']
})
export class StudentAdmissionComponent implements OnInit {
  admissionFormGroup:FormGroup;
  result:any;
  readonly rootURL = 'https://localhost:44323/api';
 constructor(private formBuilder:FormBuilder,private httpService: HttpClient) { }

  ngOnInit(): void {
    this.admissionFormGroup=this.formBuilder.group({
      fatherName:['',Validators.required],
      motherName:['',Validators.required],
      mobileNo:['',Validators.required],
      address:['',Validators.required],
      studentName:['',Validators.required],
      studentAge:['',Validators.required],
      standard:['',Validators.required]
     
    })
  }
  studentAdmission(){
   
    this.httpService.post(this.rootURL+'/admissions',{FatherName:this.admissionFormGroup.controls.fatherName.value,MotherName:this.admissionFormGroup.controls.motherName.value,MobileNo:this.admissionFormGroup.controls.mobileNo.value,Address:this.admissionFormGroup.controls.address.value,StudentName:this.admissionFormGroup.controls.studentName.value,Age:this.admissionFormGroup.controls.age.value,Standard:this.admissionFormGroup.controls.standard.value}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
    
      
    })
  }

}
