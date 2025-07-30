import {Component} from '@angular/core';
import { GalleriaModule } from 'primeng/galleria';

@Component({
  selector: 'app-certificates',
  standalone: true,
  imports: [GalleriaModule],
  templateUrl: './certificates.component.html',
  styleUrl: './certificates.component.scss'
})
export class CertificatesComponent {

  certificates: string[] = [];
  selectedCertificate: string = '';

  constructor() {
    for (let i = 1; i <= 11; i++) {
      this.certificates.push(`assets/images/sertifika/ser${i}.jpg`);
    }
  }

  selectCertificate(cert: string) {
    this.selectedCertificate = cert;
  }

}
