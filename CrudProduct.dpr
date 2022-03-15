program CrudProduct;

uses
  Vcl.Forms,
  Presentation.View.Menu in 'src\Presentation\Views\Presentation.View.Menu.pas' {fmViewMenu},
  Domain.Entity.Group in 'src\Domain\Entities\Domain.Entity.Group.pas',
  Domain.Entity.Session in 'src\Domain\Entities\Domain.Entity.Session.pas',
  Domain.Entity.Product in 'src\Domain\Entities\Domain.Entity.Product.pas',
  Domain.UseCase.Group.Create in 'src\Domain\UseCases\Group\Create\Domain.UseCase.Group.Create.pas',
  Domain.UseCase.Group.Create.Interfaces in 'src\Domain\UseCases\Group\Create\Domain.UseCase.Group.Create.Interfaces.pas',
  Domain.Abstraction.Group in 'src\Domain\Abstractons\Domain.Abstraction.Group.pas',
  Data.Repository.Group.Interfaces in 'src\Data\Repositories\Group\Data.Repository.Group.Interfaces.pas',
  Data.Repository.Group.SqLite in 'src\Data\Repositories\Group\Data.Repository.Group.SqLite.pas',
  Domain.UseCase.Group.Read.Interfaces in 'src\Domain\UseCases\Group\Read\Domain.UseCase.Group.Read.Interfaces.pas',
  Domain.UseCase.Group.Read in 'src\Domain\UseCases\Group\Read\Domain.UseCase.Group.Read.pas',
  Domain.UseCase.Group.Update.Interfaces in 'src\Domain\UseCases\Group\Update\Domain.UseCase.Group.Update.Interfaces.pas',
  Domain.UseCase.Group.Update in 'src\Domain\UseCases\Group\Update\Domain.UseCase.Group.Update.pas',
  Domain.UseCase.Group.Delete.Interfaces in 'src\Domain\UseCases\Group\Delete\Domain.UseCase.Group.Delete.Interfaces.pas',
  Domain.UseCase.Group.Delete in 'src\Domain\UseCases\Group\Delete\Domain.UseCase.Group.Delete.pas',
  Domain.Abstraction.Session in 'src\Domain\Abstractons\Domain.Abstraction.Session.pas',
  Domain.Abstraction.Product in 'src\Domain\Abstractons\Domain.Abstraction.Product.pas',
  Domain.UseCase.Session.Create.Interfaces in 'src\Domain\UseCases\Session\Create\Domain.UseCase.Session.Create.Interfaces.pas',
  Data.Repository.Session.Interfaces in 'src\Data\Repositories\Session\Data.Repository.Session.Interfaces.pas',
  Domain.UseCase.Session.Create in 'src\Domain\UseCases\Session\Create\Domain.UseCase.Session.Create.pas',
  Domain.UseCase.Session.Read.Interfaces in 'src\Domain\UseCases\Session\Read\Domain.UseCase.Session.Read.Interfaces.pas',
  Domain.UseCase.Session.Read in 'src\Domain\UseCases\Session\Read\Domain.UseCase.Session.Read.pas',
  Domain.UseCase.Session.Update.Interfaces in 'src\Domain\UseCases\Session\Update\Domain.UseCase.Session.Update.Interfaces.pas',
  Domain.UseCase.Session.Update in 'src\Domain\UseCases\Session\Update\Domain.UseCase.Session.Update.pas',
  Domain.UseCase.Session.Delete.Interfaces in 'src\Domain\UseCases\Session\Delete\Domain.UseCase.Session.Delete.Interfaces.pas',
  Domain.UseCase.Session.Delete in 'src\Domain\UseCases\Session\Delete\Domain.UseCase.Session.Delete.pas',
  Data.Repository.Product.Interfaces in 'src\Data\Repositories\Product\Data.Repository.Product.Interfaces.pas',
  Domain.UseCase.Product.Create.Interfaces in 'src\Domain\UseCases\Product\Create\Domain.UseCase.Product.Create.Interfaces.pas',
  Domain.UseCase.Product.Create in 'src\Domain\UseCases\Product\Create\Domain.UseCase.Product.Create.pas',
  Domain.UseCase.Product.Read.Interfaces in 'src\Domain\UseCases\Product\Read\Domain.UseCase.Product.Read.Interfaces.pas',
  Domain.UseCase.Product.Read in 'src\Domain\UseCases\Product\Read\Domain.UseCase.Product.Read.pas',
  Domain.UseCase.Product.Delete.Interfaces in 'src\Domain\UseCases\Product\Delete\Domain.UseCase.Product.Delete.Interfaces.pas',
  Domain.UseCase.Product.Delete in 'src\Domain\UseCases\Product\Delete\Domain.UseCase.Product.Delete.pas',
  Domain.UseCase.Product.Update.Interfaces in 'src\Domain\UseCases\Product\Update\Domain.UseCase.Product.Update.Interfaces.pas',
  Domain.UseCase.Product.Update in 'src\Domain\UseCases\Product\Update\Domain.UseCase.Product.Update.pas',
  Data.Repository.Session.SqLite in 'src\Data\Repositories\Session\Data.Repository.Session.SqLite.pas',
  Data.Repository.Product.SqLite in 'src\Data\Repositories\Product\Data.Repository.Product.SqLite.pas',
  Presentation.View.Product in 'src\Presentation\Views\Presentation.View.Product.pas' {frProduct: TFrame},
  Presentation.View.ProductSearch in 'src\Presentation\Views\Presentation.View.ProductSearch.pas' {frProductSearch: TFrame},
  Presentation.Controller.Product in 'src\Presentation\Controlers\Presentation.Controller.Product.pas',
  Data.DataModule in 'src\Data\Data.DataModule.pas' {DataModule1: TDataModule},
  Presentation.Controller.Session in 'src\Presentation\Controlers\Presentation.Controller.Session.pas',
  Presentation.View.Product.Report in 'src\Presentation\Views\Presentation.View.Product.Report.pas' {frProductReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmViewMenu, fmViewMenu);
  Application.Run;
end.
