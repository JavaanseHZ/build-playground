import { Component, OnInit } from '@angular/core';
import { LocalDataSource } from 'ng2-smart-table';
import { ContractRestService } from '../../@core/data/contract-rest-service';

@Component({
  selector: 'ngx-smart-table',
  templateUrl: './contracts.component.html',
  styles: [`
    nb-card {
      transform: translate3d(0, 0, 0);
    }
  `],
})
export class ContractsComponent implements OnInit {

  settings = {
    add: {
      addButtonContent: '<i class="nb-plus"></i>',
      createButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmCreate: true,
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmSave: true,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
       confirmDelete: true,
    },
    columns: {
      type: {
        title: 'Type',
        type: 'string',
        filter: false,
      },
      premium: {
        title: 'Premium',
        type: 'string',
        filter: false,
      },
      firstname: {
        title: 'First Name',
        type: 'string',
        filter: false,
      },
      lastname: {
        title: 'Last Name',
        type: 'string',
        filter: false,
      },
    },
  };

  source: LocalDataSource;
  contractRestService: ContractRestService;

  constructor(contractRestService: ContractRestService) {
    this.source = new LocalDataSource();
    this.contractRestService = contractRestService;
  }

  ngOnInit(): void {
    this.contractRestService.getContracts().subscribe(
      (data) => this.source.load(data),
    );
  }

  onDeleteConfirm(event): void {
    this.contractRestService.deleteContract(event.data.id).subscribe(
      () => event.confirm.resolve(),
    );
  }

  onCreateConfirm(event): void {
    const contract = {
      id: null,
      type: event.newData.type,
      premium: event.newData.premium,
      firstname: event.newData.firstname,
      lastname: event.newData.lastname,
    }
    this.contractRestService.addContract(contract).subscribe(
      (response) => event.confirm.resolve(response),
    );
  }

  onEditConfirm(event): void {
    const contract = {
      id: event.newData.id,
      type: event.newData.type,
      premium: event.newData.premium,
      firstname: event.newData.firstname,
      lastname: event.newData.lastname,
    }
    this.contractRestService.updateContract(event.data.id, contract).subscribe(
      () => event.confirm.resolve(contract),
    );
  }

}
