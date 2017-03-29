
defineClass("ViewController", {
            
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (!cell) {
            cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
            }
            cell.textLabel().setText("热修复完成");
            var redColor = require('UIColor').redColor();
            cell.setBackgroundColor(redColor);
            return cell
            },
            
             },
            {});