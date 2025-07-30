import { Component } from '@angular/core';
import {NgForOf, NgIf} from "@angular/common";

@Component({
  selector: 'app-teknofest',
  standalone: true,
    imports: [
        NgForOf,
        NgIf
    ],
  templateUrl: './teknofest.component.html',
  styleUrl: './teknofest.component.scss'
})
export class TeknofestComponent {
  images: string[] = [];
  selectedImage: string = '';

  constructor() {
    for (let i = 1; i <= 6; i++) {
      this.images.push(`assets/images/teknofest/teknofest${i}.jpg`);
    }
  }

  selectImage(image: string) {
    this.selectedImage = image;
  }
}
