import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http'; 
@Component({
  selector: 'app-pay-fees',
  templateUrl: './pay-fees.component.html',
  styleUrls: ['./pay-fees.component.css']
})
export class PayFeesComponent implements OnInit {
  feesFormGroup:FormGroup;
  result:any;
   readonly rootURL = 'https://localhost:44323/api';
  constructor(private formBuilder:FormBuilder,private httpService: HttpClient) { }

  ngOnInit(): void {
    this.feesFormGroup=this.formBuilder.group({
      studentName:['',Validators.required],
      feesAmount:['',Validators.required]
    })
  }
  feesPay(){
    this.httpService.post(this.rootURL+'/payfees',{StudentName:this.feesFormGroup.value.studentName,Fees:this.feesFormGroup.value.feesAmount}).subscribe(res=>{
      this.result=res;
      console.log(this.result);
     
      
    })
  }

}
