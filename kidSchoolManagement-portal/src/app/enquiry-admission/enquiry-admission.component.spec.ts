import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EnquiryAdmissionComponent } from './enquiry-admission.component';

describe('EnquiryAdmissionComponent', () => {
  let component: EnquiryAdmissionComponent;
  let fixture: ComponentFixture<EnquiryAdmissionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EnquiryAdmissionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EnquiryAdmissionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
