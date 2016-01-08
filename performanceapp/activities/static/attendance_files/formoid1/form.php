<?php

define('EMAIL_FOR_REPORTS', '');
define('RECAPTCHA_PRIVATE_KEY', '@privatekey@');
define('FINISH_URI', 'http://');
define('FINISH_ACTION', 'redirect');
define('FINISH_MESSAGE', 'Thanks for filling out my form!');
define('UPLOAD_ALLOWED_FILE_TYPES', 'doc, docx, xls, csv, txt, rtf, html, zip, jpg, jpeg, png, gif');

define('_DIR_', str_replace('\\', '/', dirname(__FILE__)) . '/');
require_once _DIR_ . '/handler.php';

?>

<?php if (frmd_message()): ?>
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-default-skyblue.css" type="text/css" />
<span class="alert alert-success"><?php echo FINISH_MESSAGE; ?></span>
<?php else: ?>
<!-- Start Formoid form-->
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-default-skyblue.css" type="text/css" />
<script type="text/javascript" src="<?php echo dirname($form_path); ?>/jquery.min.js"></script>
<form class="formoid-default-skyblue" style="background-color:#1A2223;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:480px;min-width:150px" method="post"><div class="title"><h2>Student Attendance Form</h2></div>
	<div class="element-input<?php frmd_add_class("input"); ?>" title="Enter students unique Student ID"><label class="title">ID<span class="required">*</span></label><input class="medium" type="text" name="input" required="required"/></div>
	<div class="element-date<?php frmd_add_class("date"); ?>"><label class="title">Date<span class="required">*</span></label><input class="large" data-format="yyyy-mm-dd" type="date" name="date" required="required" placeholder="yyyy-mm-dd"/></div>
	<div class="element-number<?php frmd_add_class("number"); ?>" title="Assign point in range 0 to 5 for homework"><label class="title">Done Homework<span class="required">*</span></label><input class="small" type="text" min="0" max="5" name="number" required="required" value=""/></div>
	<div class="element-number<?php frmd_add_class("number1"); ?>" title="Deduct point in range 0 to -5 for disturbing in class"><label class="title">Disrupting Class<span class="required">*</span></label><input class="small" type="text" min="-5" max="0" name="number1" required="required" value=""/></div>
	<div class="element-number<?php frmd_add_class("number3"); ?>" title="Assign point in range 0 to 5 for helping in class"><label class="title">Helping Classmates<span class="required">*</span></label><input class="small" type="text" min="0" max="5" name="number3" required="required" value=""/></div>
	<div class="element-textarea<?php frmd_add_class("textarea"); ?>" title="Teachers Feedback regarding student performance"><label class="title">Feedback</label><textarea class="medium" name="textarea" cols="20" rows="5" ></textarea></div>
<div class="submit"><input type="submit" value="Submit "/></div></form><script type="text/javascript" src="<?php echo dirname($form_path); ?>/formoid-default-skyblue.js"></script>

<!-- Stop Formoid form-->
<?php endif; ?>

<?php frmd_end_form(); ?>