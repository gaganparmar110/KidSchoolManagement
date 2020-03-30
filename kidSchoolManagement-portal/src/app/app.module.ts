import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {APP_ROUTING} from './app.routing';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EnquiryAdmissionComponent } from './enquiry-admission/enquiry-admission.component';
import { AddStudentComponent } from './add-student/add-student.component';
import {FormsModule,ReactiveFormsModule} from '@angular/forms';
import { PayFeesComponent } from './pay-fees/pay-fees.component';
import { HttpClientModule, HttpClient } from '@angular/common/http';
@NgModule({
  declarations: [
    AppComponent,
    EnquiryAdmissionComponent,
    AddStudentComponent,
    PayFeesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,APP_ROUTING,FormsModule,ReactiveFormsModule,HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
