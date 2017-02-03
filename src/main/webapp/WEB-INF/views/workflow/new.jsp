<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<div class="row-fluid">
	<div class="span12">
	
		<div class="widget yellow">
           	<div class="widget-title">
               	<h4><i class="icon-random"></i> New Workflow</h4>
               	
               	<span class="tools">
					<a data-ng-click="cancelNewWorkflow()" class="icon-remove" title="Cancel"></a>
				</span>
				
			</div>
			<div class="panel-body" id="tableFix">
				<div class="row">
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								<label>Name</label> <input class="form-control"
									data-ng-model="workflow.name">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
								<label>Description</label>
								<textarea class="form-control" rows="3"
									data-ng-model="workflow.description"></textarea>
							</div>
							<button class="btn btn-success" data-ng-click="saveNewWorkflow()">
								<i class="icon-ok"></i> Save
							</button>
							<button class="btn btn-danger" data-ng-click="cancelNewWorkflow()">
								<i class="icon-remove"></i> Cancel
							</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->

