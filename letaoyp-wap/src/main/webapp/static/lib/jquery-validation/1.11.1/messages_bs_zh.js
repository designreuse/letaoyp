/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, 中文 (Zhōngwén), 汉语, 漢語)
 */
jQuery.extend(jQuery.validator.messages, {
        required: "必选字段",
		remote: "请修正该字段",
		email: "请输入正确格式的电子邮件",
		url: "请输入合法的网址",
		date: "请输入合法的日期",
		dateISO: "请输入合法的日期 (ISO).",
		number: "请输入合法的数字",
		digits: "只能输入整数",
		creditcard: "请输入合法的信用卡号",
		equalTo: "请再次输入相同的值",
		accept: "请输入拥有合法后缀名的字符串",
		maxlength: jQuery.validator.format("请输入一个长度最多是 {0} 的字符串"),
		minlength: jQuery.validator.format("请输入一个长度最少是 {0} 的字符串"),
		rangelength: jQuery.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
		range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
		max: jQuery.validator.format("请输入一个最大为 {0} 的值"),
		min: jQuery.validator.format("请输入一个最小为 {0} 的值")
});

jQuery.extend(jQuery.validator.defaults, {
    errorElement: "span"
});

//Created for jQuery Validation 1.11.1
	$.validator.addMethod("synchronousRemote", function (value, element, param) {
	    if (this.optional(element)) {
	        return "dependency-mismatch";
	    }

	    var previous = this.previousValue(element);
	    if (!this.settings.messages[element.name]) {
	        this.settings.messages[element.name] = {};
	    }
	    previous.originalMessage = this.settings.messages[element.name].remote;
	    this.settings.messages[element.name].remote = previous.message;

	    param = typeof param === "string" && { url: param } || param;

	    if (previous.old === value) {
	        return previous.valid;
	    }

	    previous.old = value;
	    var validator = this;
	    this.startRequest(element);
	    var data = {};
	    data[element.name] = value;
	    var valid = "pending";
	    $.ajax($.extend(true, {
	        url: param,
	        async: false,
	        mode: "abort",
	        port: "validate" + element.name,
	        dataType: "json",
	        data: data,
	        success: function (response) {
	            validator.settings.messages[element.name].remote = previous.originalMessage;
	            valid = response === true || response === "true";
	            if (valid) {
	                var submitted = validator.formSubmitted;
	                validator.prepareElement(element);
	                validator.formSubmitted = submitted;
	                validator.successList.push(element);
	                delete validator.invalid[element.name];
	                validator.showErrors();
	            } else {
	                var errors = {};
	                var message = response || validator.defaultMessage(element, "remote");
	                errors[element.name] = previous.message = $.isFunction(message) ? message(value) : message;
	                validator.invalid[element.name] = true;
	                validator.showErrors(errors);
	                element.focus();
	            }
	            previous.valid = valid;
	            validator.stopRequest(element, valid);
	        }
	    }, param));
	    return valid;
	}, "Please fix this field.");