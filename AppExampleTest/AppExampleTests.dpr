program AppExampleTests;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  DataValidators.TBooleanDataValidator in '..\Framework\DataValidators.TBooleanDataValidator.pas',
  Interfaces.IDataValidator in '..\Framework\Interfaces.IDataValidator.pas',
  DataValidators.TestSuite in 'Framework\DataValidators.TestSuite.pas',
  DataValidators.TCurrencyDataValidator in '..\Framework\DataValidators.TCurrencyDataValidator.pas',
  DataValidators.TDateTimeDataValidator in '..\Framework\DataValidators.TDateTimeDataValidator.pas',
  DataValidators.TIntegerDataValidator in '..\Framework\DataValidators.TIntegerDataValidator.pas',
  DataValidators.TNumericDataValidator in '..\Framework\DataValidators.TNumericDataValidator.pas',
  DataValidators.TStringDataValidator in '..\Framework\DataValidators.TStringDataValidator.pas',
  Interfaces.IValidationRule in '..\Framework\Interfaces.IValidationRule.pas',
  ValidationRules.TIsEmptyValidationRule in '..\Framework\ValidationRules.TIsEmptyValidationRule.pas',
  ValidationRules.TDataTypeValidationRule in '..\Framework\ValidationRules.TDataTypeValidationRule.pas',
  EnumClasses.TDataType in '..\Framework\EnumClasses.TDataType.pas',
  ValidationRules.TMaxLengthValidationRule in '..\Framework\ValidationRules.TMaxLengthValidationRule.pas',
  ValidationRules.TestSuite in 'Framework\ValidationRules.TestSuite.pas',
  Interfaces.IField in '..\Framework\Interfaces.IField.pas',
  DataContainers.TField in '..\Framework\DataContainers.TField.pas',
  Interfaces.IRecord in '..\Framework\Interfaces.IRecord.pas',
  Utils.TArrayUtil in '..\Framework\Utils.TArrayUtil.pas',
  DataContainers.TestSuite in 'Framework\DataContainers.TestSuite.pas',
  DataContainers.TRecord in '..\Framework\DataContainers.TRecord.pas',
  Exceptions.EFieldNameMustBeUniqueException in '..\Framework\Exceptions.EFieldNameMustBeUniqueException.pas',
  Interfaces.IFile in '..\Framework\Interfaces.IFile.pas',
  DataContainers.TFile in '..\Framework\DataContainers.TFile.pas',
  Interfaces.IDefinition in '..\Framework\Interfaces.IDefinition.pas',
  Interfaces.ISource in '..\Framework\Interfaces.ISource.pas',
  Interfaces.IDestination in '..\Framework\Interfaces.IDestination.pas',
  Definition.TCSVFileDefinition in '..\Framework\Definition.TCSVFileDefinition.pas';

{R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;

end.

