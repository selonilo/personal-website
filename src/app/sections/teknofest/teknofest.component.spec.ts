import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TeknofestComponent } from './teknofest.component';

describe('TeknofestComponent', () => {
  let component: TeknofestComponent;
  let fixture: ComponentFixture<TeknofestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TeknofestComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TeknofestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
