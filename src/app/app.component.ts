import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeroComponent } from "./sections/hero/hero.component";
import { ProjectsComponent } from "./sections/projects/projects.component";
import { ExperienceComponent } from "./sections/experience/experience.component";
import { ContactComponent } from "./sections/contact/contact.component";
import { NavbarComponent } from './shared/navbar/navbar.component';
import {CertificatesComponent} from "./sections/certificates/certificates.component";
import {TeknofestComponent} from "./sections/teknofest/teknofest.component";
declare const AOS: any;

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, HeroComponent, ProjectsComponent, ExperienceComponent, ContactComponent, NavbarComponent, CertificatesComponent, TeknofestComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnInit {
  ngOnInit(): void {
    AOS.init();
  }
}
