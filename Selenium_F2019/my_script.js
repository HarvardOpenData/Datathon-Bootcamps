function generateTable() {
    var dynamicTable = document.getElementById("dynamic_table");
    if(dynamicTable.rows.length > 1){
        return;
    }
    
    for(var i = 1; i <= 10; i++){
        var row = document.createElement("tr");
        var input_cell = document.createElement("td");
        var output_cell = document.createElement("td");
        input_cell.className = "dynamic_input";
        output_cell.className = "dynamic_output";

        input_cell.innerText = i;
        output_cell.innerText = (i * i);
        row.appendChild(input_cell);
        row.appendChild(output_cell);
        dynamicTable.appendChild(row);
    }
}