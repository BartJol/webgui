package WebGUI::i18n::English::SQLReport;

our $I18N = {
	'11' => {
		message => q|<b>Debug:</b> Error: There was a problem with the query.|,
		lastUpdated => 1031514049
	},

	'71' => {
		message => q|SQL Reports are perhaps the most powerful wobject in the WebGUI arsenal. They allow a user to query data from any database that they have access to. This is great for getting sales figures from your Accounting database or even summarizing all the message boards on your web site.
<p>
<b>Nested query support</b><br>
The SQL Report wobject supports up to 4 nested queries. Each subsequent query is executed for each row in the previous query results. For example, if you have two queries: query1 and query2, then query2 will be executed once for each row returned in query1. You can use placeholder parameters to compose subqueries with data from prior queries. 
<p>

<b>Debug?</b><br>
If you want to display debugging and error messages on the page, check this box.
<p>

<b>Preprocess macros on query?</b><br>
If you're using WebGUI macros in your query you'll want to check this box.
<p>

<b>Placeholder Parameters</b><br>
Placeholders, also called parameter markers, are used to indicate values in a SQL query that will be supplied later, before the statement is executed.<br>
Placeholder Parameters are delimited by commas.<br>
There are four input types:
<ul><b>Integer</b><br>A simple number</ul>
<ul><b>Form</b><br>Form fields begin with "form:".</ul>
<ul><b>Query results</b><br>Query results begin with "query1:" through "query4:". Query results are populated with data from prior queries. So when the second query is initiated, it can used the results returned by query1. When query 5 is initiated it can use the results from queries 1 through 4.</ul>
<ul><b>String</b><br>Anything else is a string</ul>

<p>Example:
<blockquote>
Query: select * from some_table where some_field = ? and some_other_field < ?<br>
Placeholder Parameters: query1:pageId,form:field1
</blockquote>

In this example the first question mark will contain the field value of pageId in query1,
while the second question mark will contain the form variable "field1".
<p>

<b>Query</b><br>
This is a standard SQL query. If you are unfamiliar with SQL then you'll likely not want to use this wobject.<br>
A question mark ? in the query represents a placeholder. Note that the ? is not enclosed in quotation marks, even when the placeholder represents a string. 

<p>

<b>Database Link</b><br>
The administrator can configure common databases on which you can run SQL Reports, freeing you from having to know or enter the connectivity information.
<p>

<b>Paginate After</b><br>
How many rows should be displayed before splitting the results into separate pages? In other words, how many rows should be displayed per page?
<p>


|,
		lastUpdated => 1101774391
	},

	'61' => {
		message => q|SQL Report, Add/Edit|,
		lastUpdated => 1082365503
	},

	'17' => {
		message => q|<b>Debug:</b> Query:|,
		lastUpdated => 1031514049
	},
	'debug placeholder parameters' => {
                message => q|<b>Debug:</b> Processed Placeholder parameters:|,
                lastUpdated => 1031514049
        },
	'12' => {
		message => q|<b>Debug:</b> Error: Could not connect to the database.|,
		lastUpdated => 1031514049
	},

	'15' => {
		message => q|Preprocess macros on query?|,
		lastUpdated => 1031514049
	},

	'14' => {
		message => q|Paginate After|,
		lastUpdated => 1031514049
	},

	'8' => {
		message => q|Edit SQL Report|,
		lastUpdated => 1031514049
	},

	'1' => {
		message => q|SQL Report|,
		lastUpdated => 1031514049
	},

	'4' => {
		message => q|Query|,
		lastUpdated => 1031514049
	},

	'18' => {
		message => q|There were no results for this query.|,
		lastUpdated => 1031514049
	},

	'72' => {
		message => q|SQL Report Template|,
		lastUpdated => 1082371148
	},

	'73' => {
		message => q|The following variables are made available in SQL Reports:
<p>

<b>columns_loop</b><br />
A loop containing information about each column.
<br /><br />
<blockquote>

<b>column.number</b><br />
An integer starting with 1 and counting through the number of columns.
<br /><br />

<b>column.name</b><br />
The name of this column as returned by the query.
<br /><br />

</blockquote>

<b>rows_loop</b><br />
A loop containing the data returned from the query.
<br /><br />
<blockquote>

<b>row.number</b><br />
An integer starting with 1 and counting through the total list of rows.
<br /><br />

<b>row.field.<b><i>NAME</i></b>.value</b><br />
The data for a given field in this row where NAME is the name of the field as it is returned by the query.
<br /><br />

<b>row.field_loop</b><br />
A loop containing all of the fields for this row.
<br /><br />
<blockquote>

<b>field.number</b><br />
An integer starting with 1 and counting through the number of fields in this row. This is the same as column.number in the column_loop.
<br /><br />

<b>field.name</b><br />
The name of the field as it is returned by the query.
<br /><br />

<b>field.value</b><br />
The data in this field.
<br /><br />

</blockquote>
</blockquote>

<b>hasNest</b><br />
A boolean indicating whether query2 has returned any results.
<br /><br />

<b>query2.columns_loop</b><br />
A loop containing information about each column for query2.
<br /><br />
<blockquote>

<b>column.number</b><br />
An integer starting with 1 and counting through the number of columns.
<br /><br />

<b>column.name</b><br />
The name of this column as returned by the query.
<br /><br />
</blockquote>

<b>query2.rows_loop</b><br />
A loop containing the data returned from query2.
<br /><br />
<blockquote>

<b>query2.row.number</b><br />
An integer starting with 1 and counting through the total list of rows.
<br /><br />

<b>query2.row.field.<b><i>NAME</i></b>.value</b><br />
The data for a given field in this row where NAME is the name of the field as it is returned by the query.
<br /><br />

<b>query2.row.field_loop</b><br />
A loop containing all of the fields for this row.
<br /><br />
<blockquote>

<b>field.number</b><br />
An integer starting with 1 and counting through the number of fields in this row. This is the same as column.number in the column_loop.
<br /><br />

<b>field.name</b><br />
The name of the field as it is returned by the query.
<br /><br />

<b>field.value</b><br />
The data in this field.
<br /><br />

</blockquote>

<b>query2.hasNest</b><br />
A boolean indicating whether the query3 has returned any results.
<br /><br />

<b>query3.columns_loop</b><br />
A loop containing information about each column for query3.
<br /><br />

<b>query3.rows_loop</b><br />
A loop containing the data returned from query3.
<br /><br />

<b>query2.rows.count</b><br />
The total number of rows returned by query2.
<br /><br />

<b>query2.count.isZero</b><br />
A boolean indicating that query2 returned zero rows.
<br /><br />

<blockquote>

</blockquote>

</blockquote>

<b>rows.count</b><br />
The total number of rows returned by the query.
<br /><br />

<b>rows.count.isZero</b><br />
A boolean indicating that the query returned zero rows.
<br /><br />

<b>rows.count.isZero.label</b><br />
The default label for rows.count.isZero.
<br /><br />

|,
		lastUpdated => 1100235434
	},

	'16' => {
		message => q|Debug?|,
		lastUpdated => 1031514049
	},

	'10' => {
		message => q|<b>Debug:</b> Error: The SQL specified is of an improper format.|,
		lastUpdated => 1031514049
	},
	'Placeholder Parameters' => {
		message => q|Placeholder Parameters|,
		lastUpdated => 1031514049
	},
	'Add another query' => {
		message => q|Add another query|,
		lastUpdated => 1031514049
	},

};

1;
