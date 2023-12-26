import { Component } from '@angular/core';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.css']
})
export class SidenavComponent {

  ngAfterViewInit(): void {
    let arrow = document.querySelectorAll(".arrow") as NodeListOf<Element>;
    for (let i = 0; i < arrow.length; i++) {
      arrow[i].addEventListener("click", (e) => {
        // @ts-ignore
        let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
        arrowParent.classList.toggle("showMenu");
      });
    }
    let sidebar = document.querySelector(".sidebar") as HTMLVideoElement;
    let sidebarBtn = document.querySelector(".bx-menu") as HTMLVideoElement;
    sidebarBtn.addEventListener("click", () => {
      sidebar.classList.toggle("close");
    });
  }

}
