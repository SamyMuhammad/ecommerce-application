<!-- Start related-product Area -->
	<section class="related-product-area section_gap_bottom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="section-title">
						<h1>You might also like..</h1>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-9">
					<div class="row">
						@forelse ($mightLike as $product)
							<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
								<div class="single-related-product d-flex">
									<a href="#"><img src="img/r1.jpg" alt=""></a>
									<div class="desc">
										<a href="#" class="title">{{ $product->name }}</a>
										<div class="price">
											<h6>${{ $product->price }}</h6>
										</div>
									</div>
								</div>
							</div>
						@empty
						<h6>No Products Yet</h6>
						@endforelse	
					</div>
				</div>
				<div class="col-lg-3">
					<div class="ctg-right">
						<a href="#" target="_blank">
							<img class="img-fluid d-block mx-auto" src="img/category/c5.jpg" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End related-product Area -->