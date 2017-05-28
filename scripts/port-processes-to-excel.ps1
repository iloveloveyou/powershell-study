# ����ǰ������Ϣд��Excel��

# ��Excel
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true
$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Worksheets.Item(1)

# д������
$worksheet.Cells(1, 1) = "����"
$worksheet.Cells(1, 2) = "����"
$worksheet.Cells(1, 3) = "PID"
$worksheet.Cells(1, 4) = "��˾"
$worksheet.Cells(1, 5) = "�ļ�·��"

# ��ȡ������Ϣ
Get-Process |Select-Object name , description, id , company, path|foreach {$row = 2} {
    $worksheet.Cells($row, 1) = $_.name
    $worksheet.Cells($row, 2) = $_.description
    $worksheet.Cells($row, 3) = $_.id
    $worksheet.Cells($row, 4) = $_.company
    $worksheet.Cells($row, 5) = $_.path
    $row++
}


