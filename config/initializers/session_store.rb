# frozen_string_literal: true

Rails.application.config.session_store :cookie_store, key: '_react67_session', expire_after: 1.minute if Rails.env.production?
