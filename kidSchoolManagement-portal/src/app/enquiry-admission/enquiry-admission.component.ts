import { Component, OnInit } from '@angular/core';
import {enquiry} from '../kids.model';
@Component({
  selector: 'app-enquiry-admission',
  templateUrl: './enquiry-admission.component.html',
  styleUrls: ['./enquiry-admission.component.css']
})
export class EnquiryAdmissionComponent implements OnInit {
  enquiryList=enquiry;
  constructor() { }

  ngOnInit(): void {
  }

}
