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
    let age:number=this.admissionFormGroup.value.studentAge;
    let mobile:number=this.admissionFormGroup.value.mobileNo;
    this.httpService.post(this.rootURL+'/admissions',{fatherName:this.admissionFormGroup.value.fatherName,motherName:this.admissionFormGroup.value.motherName,mobileNo:mobile,address:this.admissionFormGroup.value.address,studentName:this.admissionFormGroup.value.studentName,age:age,StandardName:this.admissionFormGroup.value.standard}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
    
      
    })
  }

}
