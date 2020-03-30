import { Component, OnInit } from '@angular/core';
import {FormGroup, FormBuilder} from '@angular/forms';
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
      studentName:[''],
      studentAge:[''],
     
    })
  }

  submit(){
    this.httpService.post(this.rootURL+'/students',{StudentName:this.studentFormGroup.controls.studentName.value,Age:this.studentFormGroup.controls.studentAge.value}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
      if(this.result.StudentName==""){
        alert("student not Added ");
      }
      else{
        alert("added");
      }
      
    });
  }

}
