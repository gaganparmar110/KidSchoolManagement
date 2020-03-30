import { Component, OnInit } from '@angular/core';

import { HttpClientModule, HttpClient } from '@angular/common/http';
@Component({
  selector: 'app-enquiry-admission',
  templateUrl: './enquiry-admission.component.html',
  styleUrls: ['./enquiry-admission.component.css']
})
export class EnquiryAdmissionComponent implements OnInit {
  enquiryList=[];
  result:any;
  constructor(private httpService: HttpClient) { }

  ngOnInit(): void {
  
  this.httpService.get<any>('https://localhost:44323/api/vEnquiryAdmissions').subscribe(res=>{
    this.result=res;
    console.log(this.result);
    this.enquiryList=this.result;
  })
  }
}
