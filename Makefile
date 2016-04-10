default:
	docker build -t swift_urlencode .
	docker run -it --rm swift_urlencode bash -c "swift build && .build/debug/SwiftUrlEncode"
