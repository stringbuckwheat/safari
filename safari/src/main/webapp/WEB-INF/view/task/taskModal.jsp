<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 하위업무 수정 modal 시작 -->
<div class="modal fade text-left" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel35" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<label class="modal-title text-text-bold-600" id="myModalLabel35">하위업무 수정</label>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
                   	<label>하위 업무</label>
                    <ul class="edit-kanban-item-task">
                   		<!-- 하위 업무가 추가 된다. -->	
                   	</ul>
                </div>
                <div class="form-group">
					<label>프로젝트 선택</label>
					<select class="form-control text-dark" id="selectProject">
						<!-- 프로젝트가 추가 된다. -->
					</select>
				</div>
				<div class="form-group">
					<label>하위업무 선택</label>
					<select class="form-control text-dark" id="insertLowerTask">
						<!-- 하위업무가 추가 된다. -->
					</select>
				</div>
				<div class="form-group">
					<label>하위업무 해제</label>
					<select class="form-control text-dark" id="deleteLowerTask">
						<!-- 하위업무가 추가 된다. -->
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" id="insertLowerTaskBtn">추가</button>
				<button class="btn btn-outline-danger" id="deleteLowerTaskBtn">삭제</button>
				<input type="reset" class="btn btn-outline-secondary btn" data-dismiss="modal" value="닫기"> 
			</div>
		</div>
	</div>
</div>
<!-- 하위업무 수정 modal 끝 -->