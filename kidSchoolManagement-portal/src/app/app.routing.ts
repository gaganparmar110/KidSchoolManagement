import {Router,Route,RouterModule,PreloadAllModules,NoPreloading, Routes} from '@angular/router';
import{ModuleWithProviders} from '@angular/core';
import { EnquiryAdmissionComponent } from './enquiry-admission/enquiry-admission.component';
import { AddStudentComponent } from './add-student/add-student.component';
import { PayFeesComponent } from './pay-fees/pay-fees.component';
import { StudentAdmissionComponent } from './student-admission/student-admission.component';
const APP_ROUTES:Routes=[{
      path:'enquiryAdmission',component:EnquiryAdmissionComponent
},{
    path:'addStudent',component:AddStudentComponent
},{
    path:'payFees', component:PayFeesComponent
},{
    path:'studentAdmission',component:StudentAdmissionComponent
}]
export const APP_ROUTING:ModuleWithProviders=RouterModule.forRoot(APP_ROUTES,{
    preloadingStrategy:NoPreloading,
})